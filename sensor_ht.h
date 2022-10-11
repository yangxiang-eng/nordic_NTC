#ifndef HT_SENSOR_H
#define HT_SENSOR_H
#include <stdint.h>
#include <stdbool.h>

#define INVALID_TEMPERATURE 0xFFFF
#define INVALID_HUMIDITY 0xFFFF

typedef enum eHTMeasureResult
{
    MEASURE_SUCCESS = 0,
    MEASURE_BUSY = 1,
    START_FAILED = 0x2,
    MEASURE_FAIL = 0x3
}HTMeasureResult;

typedef void (*ht_measure_cmp_handler_t) (HTMeasureResult nMeasureRslt, float measureTemp, float measureHumidity);

//init sensor
void HT_Init(ht_measure_cmp_handler_t callback);

//self test
bool HT_SensorSelftest(void);

//start measure
uint32_t HT_startMeasure(void);

//stop sensor
void HT_SensorStop(void);

#endif

