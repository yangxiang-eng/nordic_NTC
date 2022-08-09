#if !NRF_CMP_ENABLE
#include "battery_measure.h"
#include "nordic_common.h"
//#include "tools_board.h"
//#include "advertise_mgr.h"
#include <stdlib.h>
#include <nrf_log.h>
#if LION_CHARGE_ABLE
#include "charge_detection.h"
#endif
//#include "led.h"
//#include "main.h"

#include "nrf_drv_saadc.h"

static battery_callback gap_battery_callback = NULL ; 

bool BATTERY_POWER_ON = false ; 

#if LION_CHARGE_ABLE
static uint32_t gapBatteryLowTimes = 0;
static uint32_t gapBatteryWarnningTimes = 0;
static uint32_t gapLastBatteryLowWarnningSec = 0;
typedef struct tagLionBatteryMetrix
{
    uint16_t nAdcBattery;
    uint16_t nVoltageMv;
 }LionBatteryMetrix;
static LionBatteryMetrix gapBatteryMetrix[] = {
    {2408, 2628},
    {2616, 2838},
    {2856, 3080},
    {3040, 3300},
    {3120, 3360},
    {3208, 3450},
    {3344, 3600},
    {3462, 3740},
    {3680, 3980},
    {3792, 4090},
    {3832, 4150},
    {3960, 4215},
    };
#define MAX_UTC_WARNNING_INTERVAL 8
#endif

static nrf_saadc_value_t adc_buf[2];

//declare
static void saadc_event_handler(nrf_drv_saadc_evt_t const * p_event);
//static void battery_update_voltage_percent(void);
static bool battery_update_voltage_level(uint16_t battery_lvl);
static void battery_measure_start(void);

#if LION_CHARGE_ABLE
static void charge_event_handler(bool bUsbConnected, bool bIsCharging);
#endif


void battery_measure_init(battery_callback callback)
{
#if LION_CHARGE_ABLE
    init_charge_detection(charge_event_handler);
    gap_battery_callback = callback ; 
#endif

  gap_battery_callback = callback ; 
}

uint8_t g_battPercent ;
uint16_t g_battInMilliVolts ; 

uint8_t battery_getPercent(void)
{
    return g_battPercent;
}

int16_t battery_getVoltage(void)
{
    return g_battInMilliVolts;
}

#if LION_CHARGE_ABLE
static void charge_event_handler(bool bUsbConnected, bool bIsCharging)
{
    if (is_in_charging())
    {
        adv_updateRspData();
        
#ifdef CHARGING_LED_INDICATION        
        led_flash_start_once(LED_COLOR_RED, 500);
#endif
    }
    else
    {
        main_clearWatchNum();
        
        adv_updateRspData();
    }
}

uint16_t battery_getLionBatteryLevel(uint16_t nAdcBattery)
{
    uint8_t nMaxMetrix = sizeof(gapBatteryMetrix) / sizeof(LionBatteryMetrix);
    
     if (nAdcBattery <= gapBatteryMetrix[0].nAdcBattery)
    {
        return gapBatteryMetrix[0].nVoltageMv;
    }
    else if (nAdcBattery >= gapBatteryMetrix[nMaxMetrix - 1].nAdcBattery)
    {
        return gapBatteryMetrix[nMaxMetrix - 1].nVoltageMv;
    }

    for (int i = 1; i < nMaxMetrix; i++)
    {
        if (nAdcBattery <= gapBatteryMetrix[i].nAdcBattery)
        {
            int fPercent = ((nAdcBattery - gapBatteryMetrix[i-1].nAdcBattery) *100) / (gapBatteryMetrix[i].nAdcBattery - gapBatteryMetrix[i - 1].nAdcBattery);
            uint16_t voltageLevel = gapBatteryMetrix[i - 1].nVoltageMv + (gapBatteryMetrix[i].nVoltageMv - gapBatteryMetrix[i - 1].nVoltageMv) * fPercent / 100;
            return (uint16_t)voltageLevel;
        }
    }

    return gapBatteryMetrix[nMaxMetrix - 1].nAdcBattery;
}
#endif

static void battery_measure_start(void)
{
    static uint32_t sAdcCount = 0;

    ret_code_t err_code = nrf_drv_saadc_init(NULL, saadc_event_handler);
    APP_ERROR_CHECK(err_code);


#if LION_CHARGE_ABLE
    nrf_saadc_input_t adcInput;
    adcInput = LION_BATT_CHANNEL;
    nrf_saadc_channel_config_t config = NRF_DRV_SAADC_DEFAULT_K58(adcInput);
#else 
    nrf_saadc_channel_config_t config =
        NRF_DRV_SAADC_DEFAULT_CHANNEL_CONFIG_SE(NRF_SAADC_INPUT_VDD);
#endif

    sAdcCount++;
    err_code = nrf_drv_saadc_channel_init(0, &config);
    APP_ERROR_CHECK(err_code);

    err_code = nrf_drv_saadc_buffer_convert(&adc_buf[0], 1);
    APP_ERROR_CHECK(err_code);

    err_code = nrf_drv_saadc_buffer_convert(&adc_buf[1], 1);
    APP_ERROR_CHECK(err_code);

    //start battery measure
    err_code = nrf_drv_saadc_sample();
    APP_ERROR_CHECK(err_code);
    BATTERY_POWER_ON = true ; //启动采集
 }

void battery_measure_period_call(void)
{
    static uint32_t gBatteryCallTimer = 0;

    gBatteryCallTimer++;

#if LION_CHARGE_ABLE

    #ifdef CHARGING_LED_INDICATION
        if (is_in_charging())
        {
            led_flash_start_once(LED_COLOR_RED, 300);
        }
    #endif

    int nMeasureInterval = params_getPowerOnState() ?
        LION_POWER_ON_MEASURE_INTERVAL : LION_POWER_OFF_MEASURE_INTERVAL;

    if (gBatteryCallTimer % nMeasureInterval == 0 || gBatteryCallTimer < 10)
    {
        battery_measure_start();
    }
#else
    //int nMeasureInterval = params_getPowerOnState() ?
    //    BATT_POWER_ON_MEASURE_INTERVAL : BATT_POWER_OFF_MEASURE_INTERVAL; 
    //if (gBatteryCallTimer % nMeasureInterval == 0 || gBatteryCallTimer < 10)
    //{
        battery_measure_start();
    //}
#endif    
}

static bool battery_update_voltage_level(uint16_t adc_battery_level)
{
    static uint16_t s_battery_chg_num = 0;
    static uint32_t filter_battery = 0;
    
    if (g_battInMilliVolts == 0)
    {
        g_battInMilliVolts = adc_battery_level;
        filter_battery = adc_battery_level;
        return true;
    }
    else
    {
        filter_battery = (filter_battery * 7 + adc_battery_level * 3) / 10; 
        if (abs(filter_battery -g_battInMilliVolts) >= BATTERY_LVL_CHG_THD)
        {
            s_battery_chg_num++;
            if (s_battery_chg_num >MAX_VOLTAGE_COMPARE_CHANGE)
            {
                g_battInMilliVolts = filter_battery;
                s_battery_chg_num = 0;
                return true;
            }
        }
        else
        {
            s_battery_chg_num = 0;
        }
    }

    return false;
}

static void saadc_event_handler(nrf_drv_saadc_evt_t const * p_event)
{    
    if (p_event->type == NRF_DRV_SAADC_EVT_DONE)
    {
        nrf_saadc_value_t adc_result;
        uint32_t          err_code;

        adc_result = p_event->data.done.p_buffer[0];


       
        err_code = nrf_drv_saadc_buffer_convert(p_event->data.done.p_buffer, 1);
        APP_ERROR_CHECK(err_code);



        //uninstall
        nrf_drv_saadc_uninit();
        NRF_SAADC->INTENCLR = (SAADC_INTENCLR_END_Clear << SAADC_INTENCLR_END_Pos);
        NVIC_ClearPendingIRQ(SAADC_IRQn);
        
        BATTERY_POWER_ON = false ; //结束采集
        uint32_t nAdcSampleVoltage = 0;
#if (LION_CHARGE_ABLE)
        //check if in battery
        nAdcSampleVoltage = K58_ADC_CALC(adc_result);

        #ifndef VOLTAGE_MEASURE_NO_COMPENSATE
        nAdcSampleVoltage = battery_getLionBatteryLevel(nAdcSampleVoltage);
        #endif
#else
        nAdcSampleVoltage = ADC_RESULT_IN_MILLI_VOLTS(adc_result);
        NRF_LOG_INFO("original data:%d\n",adc_result);
        //uint16_t data = (uint16_t)(nAdcSampleVoltage);
        NRF_LOG_INFO("change mv:%d\n",nAdcSampleVoltage);
        gap_battery_callback(GET_DATA_SUCCUE,nAdcSampleVoltage);
#endif

        battery_update_voltage_level(nAdcSampleVoltage);
        //battery_update_voltage_percent();
        
        //check need turn off device
#if (LION_CHARGE_ABLE)
        if  ((g_battInMilliVolts < BATTERY_LEVEL_TURN_OFF) && params_getPowerOnState())
        {
            gapBatteryLowTimes++;
        }
        else
        {
            gapBatteryLowTimes = 0;

            //battery warnning
            if ((g_battInMilliVolts < BATTERY_LEVEL_WARNNING) && params_getPowerOnState())
            {
                gapBatteryWarnningTimes++;
            }
            else
            {
                gapBatteryWarnningTimes = 0;
            }
        }
        
        if (gapBatteryLowTimes > 15 && ALLOW_LOW_BATT_POWR_OFF)
        {
            gapBatteryLowTimes = 0;
            main_startShutDownDevice();
        }
        else
        {
            uint32_t nCurrUtc = UTC_getAbsUTC2MSec(NULL);
            if (gapBatteryWarnningTimes > 5 && (nCurrUtc - gapLastBatteryLowWarnningSec) >= MAX_UTC_WARNNING_INTERVAL)
            {
                NRF_LOG_INFO("start warnning battery");
                gapBatteryWarnningTimes = 0;
                gapLastBatteryLowWarnningSec = nCurrUtc;
                
                led_flash_start(LED_COLOR_RED, 1, 80, 300);
            }
        }
#endif
    }
}

//static void battery_update_voltage_percent(void)
//{
//    static uint32_t nDifferenceBattery = 0;
    
//    //check if battery level was changed
//    uint8_t nCurrentBattery = tools_getAbsBatteryPercent(g_battInMilliVolts);
//    if (abs(nCurrentBattery - g_battPercent) >= 2 || nDifferenceBattery > 50)
//    {
//        NRF_LOG_INFO("adc battery:%d, percent:%d", g_battInMilliVolts, nCurrentBattery);
//        g_battPercent = nCurrentBattery;
//        nDifferenceBattery = 0;
//        adv_updateRspData();
//    }
//    else if (nCurrentBattery != g_battPercent)
//    {
//        nDifferenceBattery++;
//    }
//    else
//    {
//        nDifferenceBattery = 0;
//    }
//}





//void battery_stop(void)
//{

//  nrf_drv_saadc_uninit();
//  NRF_SAADC->INTENCLR = (SAADC_INTENCLR_END_Clear << SAADC_INTENCLR_END_Pos);

//  NVIC_ClearPendingIRQ(SAADC_IRQn);


//  nrf_gpio_pin_set(TP_POWER_SWITCH);
  
//  BATTERY_POWER_ON = false ; 

//}
#endif
