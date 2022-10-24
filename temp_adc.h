
#ifdef  PCA1000_ADS1115
#ifndef TEMP_ADC_H
#define TEMP_ADC_H
#include <stdint.h>
#include <stdbool.h>
#include "boards.h"

#define ADC_REF_VOLTAGE_IN_MILLIVOLTS   600                                     /**< Reference voltage (in milli volts) used by ADC while doing conversion. */
#define ADC_PRE_SCALING_COMPENSATION    4 
#define ADC_PRE_TP1_COMPENSATION 5 
#define ADC_PRE_TP2_TP1_COMPENSATION_DIFF 2  
#define ADC_PRE_SCALING_COMPENSATION_BETWON_TP2_TO_TP1    2 
#define ADC_RES_12BIT                   4096 
#define ADC_RES_14BIT                   16384
#define ADV_STABLE_TIME_MS 30

typedef enum
{
    TEMP_MEASURE_FAILED = 1,
    TEMP_MEASURE_SUCCESS = 0,
}ETempMeasureResult;

typedef void (*temp_measure_handler_t) (ETempMeasureResult nMeasureRslt, float shotTemp, float averageTemp,int averageadc);

//init sensor
void Temp_Init(temp_measure_handler_t callback);

//self test
bool Temp_SensorSelftest(void);

//start measure
uint32_t Temp_startMeasure(void);

//stop sensor
void Temp_SensorStop(void);


#endif
#endif