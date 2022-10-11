#ifndef DS18B20_H
#define DS18B20_H
#include <stdint.h>

#define u8 uint8_t

void DS18B20_init(void);

void DS18B20_StartMeasureTemperature(void);

float DS18B20_GetTemperatureLoop(void);

u8 DS18B20_ReadRomInfo(void);

u8 DS18B20_MatchROM(void);
#endif
