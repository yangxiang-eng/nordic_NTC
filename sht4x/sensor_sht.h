#ifdef TEMP_FRON_SHT
#ifndef  SENSOR_SHT_H
#define  SENSOR_SHT_H
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

typedef void (*ht_measure_cmp_handler_t)(int result, float measureTemp,float measureHumidity);

void HT_Init(ht_measure_cmp_handler_t callback);

bool HT_SensorSelftest();

void HT_startMeasure(void);

void HT_SensorStop(void);

#endif
#endif