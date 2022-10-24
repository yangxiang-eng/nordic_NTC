#ifdef TEMP_FRON_SHT
#include "sensirion_common.h"
#include "sensirion_i2c_hal.h"
#include "sht4x_i2c.h"
#include <stdio.h>
#include <stdbool.h>
#include "nrf_log.h"
#include "app_timer.h" 
#include "sensor_sht.h"   
#include "nrf_delay.h"      

static ht_measure_cmp_handler_t gap_ht_measure_callack = NULL;
static void sensor_timerout_handler();
APP_TIMER_DEF(sensor_timer);

void HT_Init(ht_measure_cmp_handler_t measure_callback){

  sensirion_i2c_hal_init();

  sht4x_soft_reset();

  ret_code_t err_code = app_timer_create(&sensor_timer, APP_TIMER_MODE_SINGLE_SHOT, sensor_timerout_handler);
  APP_ERROR_CHECK(err_code);

  gap_ht_measure_callack = measure_callback;
}

bool HT_SensorSelftest(void)
{
  uint16_t temperatrue, humidity; 

  sht4x_measure_high_precision_ticks_write();

  nrf_delay_ms(10);

  if(!sht4x_measure_high_precision_ticks(&temperatrue, &humidity))
  {
    return false ; 
  }

  //ÅÐ¶ÏÎÂ¶È·¶Î§ÊÇ·ñÊÇ0~30
  temperatrue /= 1000; 
  if(temperatrue<-50 || temperatrue >120)
  {
    return false ; 
  }
  return true ; 
}

void HT_startMeasure(void)
{
  int ret = sht4x_measure_high_precision_ticks_write();
  if (ret != 0)
  {
    gap_ht_measure_callack(ret, -1, -1);
    return;
  }

  app_timer_start(sensor_timer, APP_TIMER_TICKS(1000), NULL);
}

static void sensor_timerout_handler()
{
  int32_t temperatrue, humidity; 

  int err = sht4x_measure_high_precision(&temperatrue, &humidity);
  if (err != 0)
  {
    gap_ht_measure_callack(err, -1, -1);
    return;
  }

  float fTemperature = (temperatrue / 1000.0);
  float fHumidity = (humidity / 1000.0);
  gap_ht_measure_callack(0, fTemperature, fHumidity);
  HT_startMeasure();
}

void HT_SensorStop()
{
  //sht4x_soft_reset();
}

void stop_timer(){
  app_timer_stop(sensor_timer);
}
#endif