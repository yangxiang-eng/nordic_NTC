#include "sensor_ht.h"
#include "boards.h"
#include "app_timer.h"
#include "nrf_log.h"
//#include "tools_common.h"

#define u8 uint8_t
#define u16 uint16_t

#define HT_DIO_PIN HT_SDA_PIN
#define HT_VDD_PIN HT_SCL_PIN

#define DS18B20_OUT_0     nrf_gpio_pin_write(HT_DIO_PIN, 0);
#define DS18B20_OUT_1     nrf_gpio_pin_write(HT_DIO_PIN, 1);
#define DS18B20_READ            nrf_gpio_pin_read(HT_DIO_PIN)
static bool gap_ds18b20_output = false;

#define US_TIMER_TICKS(US)                                \
            ((uint32_t)ROUNDED_DIV(                        \
            (US) * (uint64_t)32,         \
            1000 * (APP_TIMER_CONFIG_RTC_FREQUENCY + 1)))

static inline void DelayUs(uint32_t time_us)
{
    if (time_us == 0)
    {
        return;
    }

    __ALIGN(16)
    static const uint16_t delay_machine_code[] =
    {
        0x3800 + 7, // SUBS r0, #loop_cycles
        0xd8fd, // BHI .-2
        0x4770  // BX LR
    };

    typedef void (* delay_func_t)(uint32_t);
    const delay_func_t delay_cycles =
        // Set LSB to 1 to execute the code in the Thumb mode.
        (delay_func_t)((((uint32_t)delay_machine_code) | 1));
    uint32_t cycles = time_us * NRFX_DELAY_CPU_FREQ_MHZ;
    delay_cycles(cycles);
}

static void ds_measure_timer_handler(void* p);
static u8 DS18B20_CheckDevice(void);
u8 DS18B20_ReadRomInfo(void);
u8 DS18B20_MatchROM(void);
static void print_rom_id(void);

#define RESET_DEVICE_PHASE 1
#define RESET_CHECK_RESET_CMP 2
#define RESET_WAIT_DATA_READY 3

static ht_measure_cmp_handler_t gap_measure_callback;
static uint8_t gap_reset_device_type = 0;
APP_TIMER_DEF(ds_measure_timer_id);
static u8 ROM_ID[10] = {0x0};

void DS18B20_OutPut_Mode()
{
    if (!gap_ds18b20_output)
    {
        nrf_gpio_cfg_output(HT_DIO_PIN);
        gap_ds18b20_output = true;
    }
}

void DS18B20_InPut_Mode()
{
    if (gap_ds18b20_output)
    {
        nrf_gpio_cfg_input(HT_DIO_PIN, NRF_GPIO_PIN_PULLUP);
        gap_ds18b20_output = false;
    }
}

void HT_Init(ht_measure_cmp_handler_t callback)
{
    /*1.GPIOC口初始化*/
    nrf_gpio_cfg_output(HT_VDD_PIN);
    nrf_gpio_pin_write(HT_VDD_PIN, 1);
    DS18B20_OutPut_Mode();
    gap_measure_callback = callback;

    /*2.检测DS18B20设备是否正常*/
    switch(DS18B20_CheckDevice())
    {
    case 0:
        NRF_LOG_INFO("DS18B20_Init OK!\n");
        break;
    case 1:
        NRF_LOG_ERROR("18b20 defice init failed");
        break;
    case 2:
        NRF_LOG_ERROR("18b20 defice init failed2");
        break;
    default:
        NRF_LOG_ERROR("18b20 defice init other");
        break;
    }
    DS18B20_ReadRomInfo();

    //turn off
    DS18B20_OutPut_Mode();
    DS18B20_OUT_0;
    nrf_gpio_pin_write(HT_VDD_PIN, 0);


    uint32_t err_code = app_timer_create(&ds_measure_timer_id,\
                                         APP_TIMER_MODE_SINGLE_SHOT, ds_measure_timer_handler);
    APP_ERROR_CHECK(err_code);
}

static void print_rom_id(void)
{
    printf("ROM_ID= ");
    for(int i=0; i<8; i++)
    {
        printf("%X",ROM_ID[i]);
        if(i==7) printf("\n");
        else printf("-");
    }
}

//stop sensor
void HT_SensorStop(void)
{
    DS18B20_OutPut_Mode();
    DS18B20_OUT_0;
    nrf_gpio_pin_write(HT_VDD_PIN, 0);

}


/*功能：向DS18B20发送一个复位信号*/
void DS18B20_SendRestSingle(void)
{
    /*主机发送复位信号*/
    DS18B20_OutPut_Mode();
    DS18B20_OUT_1;
    DelayUs(1);
    DS18B20_OUT_0; //拉低总线480~960 us ，对 DS18B20 芯片进行复位
    DelayUs(750);
    DS18B20_OUT_1;
    DelayUs(20);         //释放总线15~60 us
}

/*
功能：检测DS18B20存在脉冲
返回值：
			0  DS18B20设备正常
			1  DS18B20设备响应复位信号失败
			2  DS18B20设备释放总线失败
*/
u8 DS18B20_CheckReadySingle(void)
{
    u8 cnt=0;

    /*1.检测存在脉冲*/
    DS18B20_InPut_Mode();
    while(DS18B20_READ && cnt < 240) //等待DS18B20 拉低总线 （60~240 us 响应复位信号）
    {
        DelayUs(1);
        cnt++;
    }
    if(cnt>240)
    {
        NRF_LOG_INFO("wait 1 failed");
        return 1;
    }

    /*2.检测DS18B20是否释放总线*/
    cnt=0;
    DS18B20_InPut_Mode();
    while((!DS18B20_READ) && cnt<240)  //判断DS18B20是否释放总线（60~240 us 响应复位信号之后会释放总线）
    {
        DelayUs(1);
        cnt++;
    }

    if(cnt>240)
    {
        NRF_LOG_INFO("wait 2 failed");
        return 2;
    }
    else
        return 0;
}

/*
功能：检测DS18B20设备是否正常
返回值：
			0  DS18B20设备正常
			1  DS18B20设备响应复位信号失败
			2  DS18B20设备释放总线失败
*/
static u8 DS18B20_CheckDevice(void)
{
    DS18B20_SendRestSingle();/*1.主机发送复位信号*/
    return DS18B20_CheckReadySingle();/*2.检测存在脉冲*/
}

u8 BS18B20_WriteByte(u8 cmd)
{
    u8 i=0;
    DS18B20_OutPut_Mode();
    DS18B20_OUT_1;
    for(i=0; i<8; i++)
    {
        DS18B20_OUT_0;
        DelayUs(1);     //主机拉低总线写数据时间隙3us

        if (cmd & 0x01)
        {
            DS18B20_OUT_1;
        }
        else
        {
            DS18B20_OUT_0;
        }

        DelayUs(70);    //确保DS18B20已经成功读取到该位数据
        DS18B20_OUT_1;  //一位发送完成
        cmd >>=1;
        DelayUs(1);     //位间隙3us
    }
    return 0;
}


u8 DS18B20_ReadByte(void)
{
    u8 i,data=0;    
    
    DS18B20_OutPut_Mode();
    DS18B20_OUT_1;
    DelayUs(1);
    
    for(i=0; i<8; i++)
    {
        DS18B20_OUT_0;
        DelayUs(2);  //主机拉低总线读数据时间隙2us
        DS18B20_OUT_1; //释放总线，准备读取位数据

        DS18B20_InPut_Mode(); //初始化为输入模式
        DelayUs(8); //等待DS18B20的数据输出
        data >>=1 ;  //高位补0，默认以0为准
        if(DS18B20_READ)
        {
            data |= 0x80;
        }
        DelayUs(60); //延时确保DS18B20采样周期已经过去（非常重要）

        //next
        DS18B20_OutPut_Mode();
        DS18B20_OUT_1;  //释放总线准备读取下一位位数据
        DelayUs(1);
    }
    return data;
}

static void start_reset_device(void)
{
    DS18B20_OutPut_Mode();
    DS18B20_OUT_1;
    DelayUs(1);
    DS18B20_OUT_0;

    app_timer_start(ds_measure_timer_id, US_TIMER_TICKS(700), (void*)RESET_DEVICE_PHASE);
}

static void ds_measure_timer_handler(void* p)
{
    float temp_result = 0.0;
    u8 temp_H,temp_L;
    int intT,decT;
    uint32_t cmdType = (uint32_t)p;
    static int gap_wait_measure_max_time = 0;

    if (RESET_DEVICE_PHASE == cmdType)
    {
        DS18B20_OUT_1;
        DelayUs(15);

        DS18B20_InPut_Mode();

        //wait reset cmp
        app_timer_start(ds_measure_timer_id, US_TIMER_TICKS(300), (void*)RESET_CHECK_RESET_CMP);
    }
    else if (RESET_CHECK_RESET_CMP == cmdType)
    {
        if (gap_reset_device_type == 0)
        {
#if defined(DS_18B20)
            BS18B20_WriteByte(0xcc);
#elif defined(M1820Z)
            BS18B20_WriteByte(0x55);
            for (int i = 0; i < 8; i++)
            {
                BS18B20_WriteByte(ROM_ID[i]);
            }
#else
//#error "no define"
#endif

            BS18B20_WriteByte(0x44);

            //wait read temperature
            app_timer_start(ds_measure_timer_id, APP_TIMER_TICKS(1), (void*)RESET_WAIT_DATA_READY);
            gap_wait_measure_max_time = 0;
        }
        else
        {
#if defined(DS_18B20)
            BS18B20_WriteByte(0xcc);
#elif defined(M1820Z)
            BS18B20_WriteByte(0x55);
            for (int i = 0; i < 8; i++)
            {
                BS18B20_WriteByte(ROM_ID[i]);
            }
#else
//#error "no board"
#endif

            BS18B20_WriteByte(0xBE);

            temp_L=DS18B20_ReadByte(); //读取的温度低位数据
            temp_H=DS18B20_ReadByte(); //读取的温度高位数据

            short temp= ((temp_H << 8) | temp_L);
#if defined(DS_18B20)
            temp_result = temp * 0.0625;
#elif defined(M1820Z)
            temp_result = (((double)temp) / 256.0) + 40.0;
#else
//#error "no define"
#endif

            //turn off power
            DS18B20_OutPut_Mode();
            DS18B20_OUT_0;
            nrf_gpio_pin_write(HT_VDD_PIN, 0);

            int point_value = (temp_result - (int)temp_result)* 100;
            NRF_LOG_INFO("temp: %d.%02d\n", (int)temp_result, point_value);

            gap_measure_callback(MEASURE_SUCCESS, temp_result, INVALID_HUMIDITY);
        }
    }
    else if (RESET_WAIT_DATA_READY == cmdType)
    {
        if (DS18B20_ReadByte() != 0xFF)
        {
            gap_wait_measure_max_time++;

            //measure timeout
            if (gap_wait_measure_max_time > 10)
            {
                   //turn off power
                DS18B20_OutPut_Mode();
                DS18B20_OUT_0;
                nrf_gpio_pin_write(HT_VDD_PIN, 0);
                
                NRF_LOG_INFO("mesure timeout");
                gap_measure_callback(MEASURE_FAIL, INVALID_TEMPERATURE, INVALID_HUMIDITY);
            }
            else
            {
                app_timer_start(ds_measure_timer_id, APP_TIMER_TICKS(3), (void*)RESET_WAIT_DATA_READY);
            }
        }
        else
        {
            gap_reset_device_type = 1;
            start_reset_device();
        }
    }

}



float DS18B20_GetTemperatureLoop(void)
{
    uint16_t temp_H,temp_L;
    float temp_result = -1;
    int intT,decT;
    int i = 0;

    DS18B20_OutPut_Mode();
    nrf_gpio_pin_write(HT_VDD_PIN, 1);

    DS18B20_CheckDevice();   //发送复位脉冲、检测存在脉冲

#if defined(DS_18B20)
    BS18B20_WriteByte(0xcc);
#elif defined(M1820Z)
    BS18B20_WriteByte(0x55);
    for (i = 0; i < 8; i++)
    {
        BS18B20_WriteByte(ROM_ID[i]);
    }
#else
//#error "no board"
#endif

    BS18B20_WriteByte(0x44); //启动一次温度转换

    //loop
    int max_loop = 0;
    while (true)
    {
        if (DS18B20_ReadByte() == 0xff)
        {
            break;
        }
        if (max_loop++ > 100)
        {
            NRF_LOG_INFO("read temp error");
            return temp_result;
        }
    }

    DS18B20_CheckDevice();   //发送复位脉冲、检测存在脉冲

#if defined(DS_18B20)
    BS18B20_WriteByte(0xcc);
#elif defined(M1820Z)
    BS18B20_WriteByte(0x55); //跳过ROM序列检测
    for (i = 0; i < 8; i++)
    {
        BS18B20_WriteByte(ROM_ID[i]);
    }
#else
//#error "no device"
#endif

    BS18B20_WriteByte(0xBE); //读取温度

    temp_L = DS18B20_ReadByte();
    temp_H = DS18B20_ReadByte();
    short temp= ((temp_H << 8) | temp_L);
#if defined(DS_18B20)
    temp_result = temp * 0.0625;
#elif defined(M1820Z)
    temp_result = (((double)temp) / 256.0) + 40.0;
#else
//#error "no device"
#endif

    DS18B20_OutPut_Mode();
    DS18B20_OUT_0;
    nrf_gpio_pin_write(HT_VDD_PIN, 0);


    return temp_result;
}


//start measure
uint32_t HT_startMeasure(void)
{
    print_rom_id();
    nrf_gpio_pin_write(HT_VDD_PIN, 1);

    gap_reset_device_type = 0;
    start_reset_device();
}

//self test
bool HT_SensorSelftest(void)
{
    float temp = DS18B20_GetTemperatureLoop();
    if (temp < 35 && temp > 10)
    {
        NRF_LOG_INFO("HT self test success:%d", (int)temp);
        return true;
    }
    else
    {
        NRF_LOG_ERROR("HT self test failed:%d", (int)temp);
        return false;
    }
}


u8 DS18B20_ReadRomInfo(void)
{
    u8 i=0;
    BS18B20_WriteByte(0x33);  /*4.启动读取ROM*/
    for(i=0; i<8; i++)
    {
        ROM_ID[i]=DS18B20_ReadByte();
    }
    return 0;
}

/*功能：匹配 DS18B20  ROM信息*/
u8 DS18B20_MatchROM(void)
{
    u8 i=0;
    BS18B20_WriteByte(0x55);  /*4.匹配64位 ROM 信息*/
    for(i=0; i<8; i++)
    {
        BS18B20_WriteByte(ROM_ID[i]);
    }
    return 0;
}

