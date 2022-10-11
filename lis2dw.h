#ifndef  LIS2DW_XYZ
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef LIS2DW12_H
#define LIS2DW12_H

/* Includes ------------------------------------------------------------------*/
#include "stdint.h"


#define LIS2DW12_ADDR_READ                      0x19
  
/*register address*/ //只读
#define LIS2DW12_OUT_T_L		  	0xD //温度寄存器高
#define LIS2DW12_OUT_T_H		  	0xE  //温度寄存器低

#define LIS2DW12_REG_WHO_AM_I                   0xF

//控制寄存器      //读写
#define LIS2DW12_CTRL1				0x20        //启动加速计寄存器
#define LIS2DW12_CTRL2				0x21
#define LIS2DW12_CTRL3				0x22       //锁存中断
#define LIS2DW12_CTRL4_INT1_PAD_CTRL	        0x23       //中断1寄存器
#define LIS2DW12_CTRL5_INT2_PAD_CTRL	        0x24       //中断2寄存器
#define LIS2DW12_CTRL6				0x25       //设置功率模式

//温度寄存器输出        //只读
#define LIS2DW12_OUT_T				0x26
//数据状态寄存器
#define LIS2DW12_CFG_STATUS                     0x27

//加速计寄存器输出          //只读
#define LIS2DW12_OUT_X_L			0x28
#define LIS2DW12_OUT_X_H			0x29
#define LIS2DW12_OUT_Y_L			0x2A
#define LIS2DW12_OUT_Y_H			0x2B
#define LIS2DW12_OUT_Z_L			0x2C
#define LIS2DW12_OUT_Z_H			0x2D
//先进先出控制寄存器
#define LIS2DW12_FIFO_CTRL			0x2E  //读写
#define LIS2DW12_FIFO_SAMPLES                   0x2F

#define LIS2DW12_TAP_THS_X			0x30
#define LIS2DW12_TAP_THS_Y			0x31
#define LIS2DW12_TAP_THS_Z			0x32
#define LIS2DW12_INT_DUR			0x33

#define LIS2DW12_WAKE_UP_THS                    0x34
#define LIS2DW12_WAKE_UP_DUR                    0x35        //唤醒事件

#define LIS2DW12_FREE_FALL			0x36        //自由落体事件
#define LIS2DW12_STATUS_DUP			0x37
#define LIS2DW12_WAKE_UP_SRC                    0x38      
#define LIS2DW12_TAP_SRC			0x39        //判断是否产生单击或者双击事件
#define LIS2DW12_SIXD_SRC			0x3A

#define LIS2DW12_ALL_INT_SRC                    0x3B

#define LIS2DW12_X_OFS_USR			0x3C
#define LIS2DW12_Y_OFS_USR			0x3D
#define LIS2DW12_Z_OFS_USR			0x3E

#define LIS2DW12_CTRL7				0x3F        //使能中断

#define LIS2DW12_ORD_25Hz                       0x31
#define LIS2DW12_ORD_50Hz                       0x41
#define LIS2DW12_ORD_100Hz                      0x51

#define GET_ERROR     1
#define GET_SUCCE     0

typedef struct {
  int16_t ARW_X ; 
  int16_t ARW_Y ;
  int16_t ARW_Z ;
}ARW_XYZ;

//获取温度
float GET_TEMP_DATA();



//关闭传感器
void LIS2DW12_SensorStop();

//重置
void LIS2DW12_SoftReset();

//获取  X Y Z 
uint8_t LIS2DW12_Get_Pos_AxesRaw(ARW_XYZ *buff);

//双击
uint8_t LIS2DW12_Double_Click(uint8_t X_Duration,uint8_t Y_Duration , uint8_t Z_Duration);

//单击
uint8_t LIS2DW12_Single_Click(uint8_t X_Duration,uint8_t Y_Duration , uint8_t Z_Duration);

//检测是否发生单击或者双击
uint8_t LIS2DW12_Check_Click();

//初始化
void LIS2DW12_PosEnable();

//自检
bool LIS2DW12_StartSelfTest(void);

//自由落体
void LIS2DW12_Free_FALL(uint8_t fall_timer,uint8_t nDuration);    //下落时间,下落阀值

//自由落体检测
void LIS2DW12_Check_Fall();

//设置方向检测
uint8_t  LIS2DW12_Set_Motion_Detection(uint8_t ord , uint8_t accRange , uint8_t nDuration);

//获取方向检测
uint8_t LIS2DW12_Get_Motion_Detection();

//获取中断信号
uint8_t LIS2DW12_Get_Int1Src(uint8_t *val);
uint8_t LIS2DW12_Get_Int2Src(uint8_t *val);
#endif /* LIS2DW12_H */

#endif