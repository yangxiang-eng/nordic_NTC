#include "boards.h"
#include "app_timer.h"
#include "nrf_log.h"
#include "ads1115.h"
#include "nrf_log.h"
#include "AccMgr.h"
#include "app_timer.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"

static uint16_t adc1_data = 0 ; 
static uint16_t adc2_data = 0 ;
static uint16_t adc3_data = 0 ; 
#define ADC1 0
#define ADC2 1
#define START_POWER_KEY 2
#define ADC3 3
#define ADC_SINGLE 4

//两个通道之间采样间隔
#define WIRTE_READ_WAIT_TIMER_MS 15

//每次采样间隔
#define SAMPILNG_MS  2000

APP_TIMER_DEF(m_measure_adc_timer);
APP_TIMER_DEF(m_measure_wait_read_timer);

extern uint8_t Acc_ReadReg(uint8_t addr,uint16_t *buf);
extern uint8_t Acc_WriteReg(uint8_t addr,uint16_t buf);
void readADC_Differential_0_1();
void readADC_Differential_2_3();
void readADC_Differential_0_1_external_ref_Int3();

uint8_t read_write_between_ms ; 
adsGain_t m_adc_gain ; 
uint8_t m_bitShift ;  

static bool differential_get = false ; 

static ads1115_callback gsp_callback_handler = NULL ; 
uint8_t temp = 3 ; 
static void adc_callback(void *p)
{
  nrf_gpio_pin_write(TP_POWER_SWITCH,0);
  app_timer_start(m_measure_wait_read_timer,APP_TIMER_TICKS(WIRTE_READ_WAIT_TIMER_MS),(void*)START_POWER_KEY);
  app_timer_start(m_measure_adc_timer,APP_TIMER_TICKS(SAMPILNG_MS),NULL);
  
}

static void wait_read_handler(void *p)
{
  uint32_t cmdType = (uint32_t)p;
  uint16_t adc_data = 0 ; 
  Acc_ReadReg(ADS1015_REG_POINTER_CONVERT,&adc_data);
  uint16_t adc_temp = adc_data ; 
  
  adc_data /= (32768/(4096)) ; //v = adc_data * 4096 * 2 / 65535
  
  if(cmdType == ADC1)
  {
    adc1_data = adc_data ;
    NRF_LOG_INFO("ADC1 Sampling Ponts Number :%d ",adc_temp);
  }
  if(cmdType == ADC2)
  {
    nrf_gpio_pin_write(TP_POWER_SWITCH,1);
    adc2_data = adc_data;
    NRF_LOG_INFO("ADC2 Sampling Ponts Number:%d ",adc_temp);
    gsp_callback_handler(adc1_data,adc2_data);
  }
  
  if(differential_get)
  {
    readADC_Differential_2_3();
  }
  
  if(cmdType == START_POWER_KEY)
  {
    readADC_Differential_0_1();
   
  }
  
}

void ads1115_init(ads1115_callback ads1115_callback)
{
  nrf_gpio_cfg_output(TP_POWER_SWITCH);
  nrf_gpio_pin_write(TP_POWER_SWITCH,0);
  read_write_between_ms = ADS1115_CONVERSIONDELAY ; 
  m_bitShift = 0 ; 
  m_adc_gain = GAIN_ONE  ; 


  nrf_gpio_cfg_output(SPIS_CS);
  nrf_gpio_cfg_output(SPIS_SCK);
  nrf_gpio_cfg_output(SPIS_MISO_PIN);
  nrf_gpio_cfg_output(SPIS_MOSI_PIN);
  nrf_gpio_cfg_output(SCL_PIN);
  nrf_gpio_cfg_output(SDA_PIN);
  nrf_gpio_cfg_output(SPIS_RDY);
  nrf_gpio_pin_write(SPIS_CS,1);
  nrf_gpio_pin_write(SPIS_SCK,0);
  nrf_gpio_pin_write(SPIS_RDY,1);
  nrf_gpio_pin_write(SCL_PIN,1); 
  nrf_gpio_pin_write(SDA_PIN,1);
  

  app_timer_create(&m_measure_adc_timer,APP_TIMER_MODE_SINGLE_SHOT,adc_callback);
  app_timer_create(&m_measure_wait_read_timer,APP_TIMER_MODE_SINGLE_SHOT,wait_read_handler);
  app_timer_start(m_measure_adc_timer,APP_TIMER_TICKS(SAMPILNG_MS),NULL);
  gsp_callback_handler = ads1115_callback ; 
}


void readADC_singleEnded( uint8_t channel) {
  if (channel > 3) 
  {
    NRF_LOG_INFO("channel illegal");
  }
  

  //m_xfer_done = false;
  // Start with the default values
  uint16_t config = ADS1015_REG_CONFIG_CQUE_NONE |    // Disable the comparator (default val)
                    ADS1015_REG_CONFIG_CLAT_NONLAT |  // Non-latching (default val)
                    ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Ready active low (default val)
                    ADS1015_REG_CONFIG_CMODE_TRAD |   // Traditional comparator
                    ADS1015_REG_CONFIG_DR_MASK |   // 1600 samples per second (default)
                    ADS1015_REG_CONFIG_MODE_SINGLE;   // Single shot mode (default)

  // Set PGA/Voltage gain
  config |= m_adc_gain;

  // Set single-ended input channel to read from
  switch (channel) {
  case (0):
    config |= ADS1015_REG_CONFIG_MUX_SINGLE_0;
    break;
  case (1):
    config |= ADS1015_REG_CONFIG_MUX_SINGLE_1;
    break;
  case (2):
    config |= ADS1015_REG_CONFIG_MUX_SINGLE_2;
    break;
  case (3):
    config |= ADS1015_REG_CONFIG_MUX_SINGLE_3;
    break;
  }

  // Set "start single-conversion" bit
  config |= ADS1015_REG_CONFIG_OS_SINGLE;

  // Write config register to the ADC
  // Note: currently block until the write happens
  //writeRegister(p_instance, m_i2cAddress, ADS1115_REG_POINTER_CONFIG, config);
  Acc_WriteReg(ADS1015_REG_POINTER_CONFIG,config);

 app_timer_start(m_measure_wait_read_timer,APP_TIMER_TICKS(WIRTE_READ_WAIT_TIMER_MS),(void*)ADC_SINGLE);
}

void setGAIN(adsGain_t gain)
{
  m_adc_gain = gain ; 
}

void getGain()
{
  NRF_LOG_INFO("gain : %d ",m_adc_gain);
}


/**************************************************************************/
/*! 
    @brief  Reads the conversion results, measuring the voltage
            difference between the P (AIN0) and N (AIN1) input.  Generates
            a signed value since the difference can be either
            positive or negative.
*/
/**************************************************************************/
void readADC_Differential_0_1() {
  //nrf_gpio_pin_write(TP_POWER_SWITCH,0); 

  // Start with default values
  uint16_t config = ADS1015_REG_CONFIG_CQUE_NONE    | // Disable the comparator (default val)
                    ADS1015_REG_CONFIG_CLAT_NONLAT  | // Non-latching (default val)
                    ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Rdy active low   (default val)
                    ADS1015_REG_CONFIG_CMODE_TRAD   | // Traditional comparator (default val)
                    ADS1015_REG_CONFIG_DR_MASK    | // MAX samples per second (default)
                    ADS1015_REG_CONFIG_MODE_SINGLE;   // Single-shot mode (default)

  // Set PGA/voltage range
  config |= m_adc_gain;
                    
  // Set channels
  config |= ADS1015_REG_CONFIG_MUX_DIFF_0_1;          // AIN0 = P, AIN1 = N

  // Set 'start single-conversion' bit
  config |= ADS1015_REG_CONFIG_OS_SINGLE;

  // Write config register to the ADC
  Acc_WriteReg(ADS1015_REG_POINTER_CONFIG, config);
  differential_get = true  ;
  app_timer_start(m_measure_wait_read_timer,APP_TIMER_TICKS(WIRTE_READ_WAIT_TIMER_MS),(void*)ADC1);
}

/**************************************************************************/
/*! 
    @brief  Reads the conversion results, measuring the voltage
            difference between the P (AIN2) and N (AIN3) input.  Generates
            a signed value since the difference can be either
            positive or negative.
*/
/**************************************************************************/
void readADC_Differential_2_3() {
  //nrf_gpio_pin_write(TP_POWER_SWITCH,0); 
  // Start with default values
  uint16_t config = ADS1015_REG_CONFIG_CQUE_NONE    | // Disable the comparator (default val)
                    ADS1015_REG_CONFIG_CLAT_NONLAT  | // Non-latching (default val)
                    ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Rdy active low   (default val)
                    ADS1015_REG_CONFIG_CMODE_TRAD   | // Traditional comparator (default val)
                    ADS1015_REG_CONFIG_DR_MASK   | // MAX samples per second (default)
                    ADS1015_REG_CONFIG_MODE_SINGLE;   // Single-shot mode (default)

  // Set PGA/voltage range
  config |= m_adc_gain;

  // Set channels
  config |= ADS1015_REG_CONFIG_MUX_DIFF_2_3;          // AIN2 = P, AIN3 = N

  // Set 'start single-conversion' bit
  config |= ADS1015_REG_CONFIG_OS_SINGLE;

  // Write config register to the ADC
  Acc_WriteReg(ADS1015_REG_POINTER_CONFIG, config);

  // Wait for the conversion to complete
  differential_get = false ; 

  
  app_timer_start(m_measure_wait_read_timer,APP_TIMER_TICKS(WIRTE_READ_WAIT_TIMER_MS),(void*)ADC2);
}

/**************************************************************************/
/*!
    @brief  Sets up the comparator to operate in basic mode, causing the
            ALERT/RDY pin to assert (go from high to low) when the ADC
            value exceeds the specified threshold.

            This will also set the ADC in continuous conversion mode.
*/
/**************************************************************************/
void startComparator_SingleEnded(uint8_t channel, int16_t threshold)
{
   
  
  // Start with default values
  uint16_t config = ADS1015_REG_CONFIG_CQUE_1CONV   | // Comparator enabled and asserts on 1 match
                    ADS1015_REG_CONFIG_CLAT_LATCH   | // Latching mode
                    ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Rdy active low   (default val)
                    ADS1015_REG_CONFIG_CMODE_TRAD   | // Traditional comparator (default val)
                    ADS1015_REG_CONFIG_DR_1600SPS   | // 1600 samples per second (default)
                    ADS1015_REG_CONFIG_MODE_CONTIN  | // Continuous conversion mode
                    ADS1015_REG_CONFIG_MODE_CONTIN;   // Continuous conversion mode

  // Set PGA/voltage range
  config |= m_adc_gain;
                    
  // Set single-ended input channel
  switch (channel)
  {
    case (0):
      config |= ADS1015_REG_CONFIG_MUX_SINGLE_0;
      break;
    case (1):
      config |= ADS1015_REG_CONFIG_MUX_SINGLE_1;
      break;
    case (2):
      config |= ADS1015_REG_CONFIG_MUX_SINGLE_2;
      break;
    case (3):
      config |= ADS1015_REG_CONFIG_MUX_SINGLE_3;
      break;
  }

  // Set the high threshold register
  // Shift 12-bit results left 4 bits for the ADS1015
  Acc_WriteReg(ADS1015_REG_POINTER_HITHRESH, threshold << m_bitShift);

  // Write config register to the ADC
   uint16_t res = 0 ;
   Acc_ReadReg(ADS1015_REG_POINTER_CONVERT,&res);
  NRF_LOG_INFO("get  threshold  data : %d",res);
}

/**************************************************************************/
/*!
    @brief  In order to clear the comparator, we need to read the
            conversion results.  This function reads the last conversion
            results without changing the config value.
*/
/**************************************************************************/
int16_t getLastConversionResults()
{
  // Wait for the conversion to complete

  // Read the conversion results
  uint16_t res = 0 ;
  Acc_ReadReg(ADS1015_REG_POINTER_CONVERT,&res);
  NRF_LOG_INFO("get  getLastConversionResults  data : %d",res);
  if (m_bitShift == 0)
  {
    return (int16_t)res;
  }
  else
  {
    // Shift 12-bit results right 4 bits for the ADS1015,
    // making sure we keep the sign bit intact
    if (res > 0x07FF)
    {
      // negative number - extend the sign to 16th bit
      res |= 0xF000;
    }
    return (int16_t)res;
  }
}


void readADC_Differential_0_1_external_ref_Int3()
{
     nrf_gpio_pin_write(TP_POWER_SWITCH,0);
   
  
  uint16_t sgm_set_int_ref = SGM58031_REG_CONFIG_EXT_REF ;


  Acc_WriteReg(SGM50831_REG_POINTER_CONFIG_1,sgm_set_int_ref);

   uint16_t config = ADS1015_REG_CONFIG_CQUE_NONE    | // Disable the comparator (default val)
                    ADS1015_REG_CONFIG_CLAT_NONLAT  | // Non-latching (default val)
                    ADS1015_REG_CONFIG_CPOL_ACTVLOW | // Alert/Rdy active low   (default val)
                    ADS1015_REG_CONFIG_CMODE_TRAD   | // Traditional comparator (default val)
                    ADS1015_REG_CONFIG_DR_1600SPS    | // 1600 samples per second (default)
                    ADS1015_REG_CONFIG_MODE_SINGLE;   // Single-shot mode (default)

   config |= m_adc_gain ; 

   config |= ADS1015_REG_CONFIG_MUX_DIFF_0_1 ; 

   config |= ADS1015_REG_CONFIG_OS_SINGLE ; 

   Acc_WriteReg(ADS1015_REG_POINTER_CONFIG,config);
 

   differential_get = false ; 
   app_timer_start(m_measure_wait_read_timer,APP_TIMER_TICKS(WIRTE_READ_WAIT_TIMER_MS),(void*)ADC3);
}