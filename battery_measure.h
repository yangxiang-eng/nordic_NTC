#if !NRF_CMP_ENABLE

#ifndef BATTERY_MEASURE_H
#define BATTERY_MEASURE_H
#include <stdint.h>
#include <stdbool.h>

    //must >=3, period is 9 seconds
#define LION_POWER_ON_MEASURE_INTERVAL 3
#define LION_POWER_OFF_MEASURE_INTERVAL 6

#define BATT_POWER_ON_MEASURE_INTERVAL 6
#define BATT_POWER_OFF_MEASURE_INTERVAL 12

#if LION_CHARGE_ABLE
#define MAX_VOLTAGE_COMPARE_CHANGE     10
#else
#define MAX_VOLTAGE_COMPARE_CHANGE 4
#endif
#define BATTERY_LVL_CHG_THD 30


//battery level measure
#define K58_ADC_CALC(ADC_VALUE) ((((ADC_VALUE) *600) / 1024) * 8)
#define NRF_DRV_SAADC_DEFAULT_K58(PIN_P) \
    {                                                  \
        .resistor_p = NRF_SAADC_RESISTOR_DISABLED,     \
        .resistor_n = NRF_SAADC_RESISTOR_DISABLED,     \
        .gain       = NRF_SAADC_GAIN1_4,               \
        .reference  = NRF_SAADC_REFERENCE_INTERNAL,    \
        .acq_time   = NRF_SAADC_ACQTIME_10US,          \
        .mode       = NRF_SAADC_MODE_SINGLE_ENDED,     \
        .burst      = NRF_SAADC_BURST_DISABLED,        \
        .pin_p      = (nrf_saadc_input_t)(PIN_P),      \
        .pin_n      = NRF_SAADC_INPUT_DISABLED         \
    }

#define ADC_REF_VOLTAGE_IN_MILLIVOLTS   600                                     /**< Reference voltage (in milli volts) used by ADC while doing conversion. */
#define ADC_PRE_SCALING_COMPENSATION1    6                                       /**< The ADC is configured to use VDD with 1/3 prescaling as input. And hence the result of conversion is to be multiplied by 3 to get the actual value of the battery voltage.*/
#define DIODE_FWD_VOLT_DROP_MILLIVOLTS  270                                     /**< Typical forward voltage drop of the diode . */
#define ADC_RES_10BIT                   1024                                    /**< Maximum digital value for 10-bit ADC conversion. */
#define ADC_RESULT_IN_MILLI_VOLTS(ADC_VALUE)\
        ((((ADC_VALUE) * ADC_REF_VOLTAGE_IN_MILLIVOLTS) / ADC_RES_10BIT) * ADC_PRE_SCALING_COMPENSATION1)




typedef enum{
  
  GET_DATA_SUCCUE =  1 , 
  GET_DATA_FAILE = 0 ,

}battery_get_data;

typedef void(*battery_callback)(battery_get_data result , uint16_t data);


void battery_measure_init(battery_callback callback);

uint8_t battery_getPercent(void);

int16_t battery_getVoltage(void);

void battery_measure_period_call(void);

//void battery_stop(void);

#endif

#endif
