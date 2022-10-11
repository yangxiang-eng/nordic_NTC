#ifndef LIS2DW_XYZ
#include <nrf_delay.h>
#include <nrf_drv_twi.h>
#include <stdio.h>
#include "boards.h"
#include "lis2dw.h"
#include "nrf_log.h"
#include "nrf_drv_twi.h"
#include "nrf_delay.h"
#include "math.h"
#include <stdlib.h>

static int16_t acceleration[3]={0,0,0};
#define SENSITIVITY_2g 0.244   //mg



extern uint8_t Acc_ReadReg(uint8_t , uint8_t *buf);

extern uint8_t Acc_WriteReg(uint8_t addr , uint8_t buf);


static uint8_t LIS2DW_ReadReg(uint8_t addr , uint8_t *buf)
{
  return Acc_ReadReg(addr,buf);
}


static uint8_t LIS2DW_WriteReg(uint8_t addr , uint8_t buf)
{
  return Acc_WriteReg(addr,buf);
}


uint8_t set_Reg_LIS2DE(uint8_t addr , uint8_t buf)
{
  return LIS2DW_WriteReg(addr,buf);
}



//初始化
void LIS2DW12_PosEnable()
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x11);                      //1.6   HZ 低功耗   14位分辨率
  
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0x10);                      //将中断使能至引脚
  
  //set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x7F);        //需要将中断信号写入中断寄存器才会有对应的中断信号
  //set_Reg_LIS2DE(LIS2DW12_CTRL5_INT2_PAD_CTRL,0x7F);
  
  NRF_LOG_INFO("LIS2DW sensor enable\n");
}


//获取  加速计的值

//成功返回 0 不成功返回 1
uint8_t LIS2DW12_Get_Pos_AxesRaw(ARW_XYZ *buff)
{
  int16_t value = 0 ; 
  uint8_t *valueL = (uint8_t *)(&value);
  uint8_t *valueH = ((uint8_t *)(&value)+1);


  if(!LIS2DW_ReadReg(LIS2DW12_OUT_X_H,valueH))
  {
    return GET_ERROR ; 
  }
  if(!LIS2DW_ReadReg(LIS2DW12_OUT_X_L,valueL))
  {
    return GET_ERROR ; 
  }
  buff->ARW_X = (value >> 2) * SENSITIVITY_2g ; 

 
  if(!LIS2DW_ReadReg(LIS2DW12_OUT_Y_H,valueH))
  {
    return GET_ERROR ; 
  }
  if(!LIS2DW_ReadReg(LIS2DW12_OUT_Y_L,valueL))
  {
    return GET_ERROR ; 
  }
  buff->ARW_Y = (value >> 2) * SENSITIVITY_2g ; 


 if(!LIS2DW_ReadReg(LIS2DW12_OUT_Z_H,valueH))
  {
    return GET_ERROR ; 
  }
  if(!LIS2DW_ReadReg(LIS2DW12_OUT_Z_L,valueL))
  {
    return GET_ERROR ; 
  }
  buff->ARW_Z = (value >> 2) * SENSITIVITY_2g ; 
  //NRF_LOG_INFO("X : %d  Y : %d  Z : %d\n",buff->ARW_X,buff->ARW_Y,buff->ARW_Z);
  return GET_SUCCE ; 
}


/*
	4D_EN  6D_THS1  6D_THS0   TAP_THSX4   TAP_THSX_3  TAP_THSX_2  TAP_THSX_1  TAP_THSX_0  


	4D_EN : enable 4D 
	
	6D_THS1:6D_THS0 4D/6D threshold setting 
	
	TAP_THSX_4:TAP_TAP_THSX_0 : Threshold for Tap recognition
*/

//单击
uint8_t LIS2DW12_Single_Click(uint8_t X_Duration,uint8_t Y_Duration , uint8_t Z_Duration)
{
  if(!set_Reg_LIS2DE(LIS2DW12_CTRL1,0x71))  //启动加速计      ,     ODM = 200 HZ , 高性能
  {
    NRF_LOG_INFO("start lis2dw failed\n");
    return GET_ERROR ; 
  }

  if(!set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04)) // 使能  FS +- 2g LOW_NOISE 
  {
    NRF_LOG_INFO("enable lis2dw failed\n");
    return GET_ERROR ; 
  }

  if(!set_Reg_LIS2DE(LIS2DW12_TAP_THS_X,X_Duration)) //设置  X轴的点击阀值       
  {
    NRF_LOG_INFO("set Single X failed\n");
    return GET_ERROR ;
  }
  
  if(!set_Reg_LIS2DE(LIS2DW12_TAP_THS_Y,0xE0 +Y_Duration )) //设置  Y轴的点击阀值  0xE0 表示使能X Y Z 点击事件 
  if(!set_Reg_LIS2DE(LIS2DW12_TAP_THS_Y,0xE0 +Z_Duration)) //设置  Y轴的点击阀值   0xE0 表示使能X Y Z 点击事件 
  {
    NRF_LOG_INFO("set Single Y failed\n");
    return GET_ERROR ; 
  }

  if(!set_Reg_LIS2DE(LIS2DW12_TAP_THS_Z,0xE9)) //设置  Z轴的点击阀值
  {
    NRF_LOG_INFO("set Single Z failed\n");
    return GET_ERROR ; 
  }
  
  if(!set_Reg_LIS2DE(LIS2DW12_INT_DUR,0x06)) // 设置   quiet 和  shock 时间窗口 
  {
    NRF_LOG_INFO("set single shock timer failed\n");
    return GET_ERROR ; 
  }
  
  if(!set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x00)) //只使能单击
  {
     NRF_LOG_INFO("enable single failed\n");
     return GET_ERROR ; 
  }
  
  if(!set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x40)) //单击中断驱动至       INT1 引脚
  {
    NRF_LOG_INFO("enabled INT1 failed\n");
    return GET_ERROR ; 
  }
 
  if(!set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20)) //使能中断
  {
    NRF_LOG_INFO(" INT1 enabled failed\n");
    return GET_ERROR ; 
  }
  NRF_LOG_INFO("all configure finish\n");
  return GET_SUCCE ; 
}

/*
                                  TAP_THS_X
     
     4D_EN   6D_THS1  6D_THS0       TAP_THSX_4  TAP_THSX_3   TAP_THSX_2  TAP_THSX_1  TAP_THSX_0
     
     Duration = TAP_THSX[4:0]
*/

//单击和双击检测使用高通滤波器,需要使用高性能的加速计
uint8_t LIS2DW12_Double_Click(uint8_t X_Duration,uint8_t Y_Duration , uint8_t Z_Duration)
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x71);  //启动加速计      ,     ODM = 200 HZ , 高性能    

  set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04); // 使能  FS +- 2g LOW_NOISE 


  set_Reg_LIS2DE(LIS2DW12_TAP_THS_X,X_Duration); //设置  X轴的点击阀值         

  set_Reg_LIS2DE(LIS2DW12_TAP_THS_Y,0xE0 + Y_Duration ); //设置  Y轴的点击阀值   0xE0 表示使能X Y Z 点击事件     

  set_Reg_LIS2DE(LIS2DW12_TAP_THS_Z,0xE0 + Z_Duration); //设置  Z轴的点击阀值    0xE0 表示使能X Y Z 点击事件 

  set_Reg_LIS2DE(LIS2DW12_INT_DUR,0x7F); // 设置   quiet 和  shock 时间窗口      INT_DUR QUIET字段不为0表示锁存模式禁用

  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x80); //使能单击和双击

  set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x8); //双击中断驱动至       INT1 引脚


  set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20); //使能中断

  return GET_SUCCE ; 

}

/*
	TAP_SRC:
	
	0 	TAP_IA	SINGLE_TAP	DOUBLE_TAP	TAP_SIGN	X_TAP	Y_TAP	Z_TAP
	
	当检测到单击或双击事件时,TAP_IA为1
	当检测到单击时,SINGLE_TAP为1
	当检测到双击时,DOUBLE为1
	TAP_SIGN指示检测到点击事件时的加速度符号,符号为正时它为0,符号为负时它为1

        ALL_INT_SRC:
        0   0         sleep_change_ia     6d_ia     double_tap    single_tap    wu_ia     ff_ia

        //以上两种寄存器都可以检测单击或者双击
*/
uint8_t LIS2DW12_Check_Click()
{
  uint8_t Click_Data = 0 ; 
  LIS2DW_ReadReg(LIS2DW12_TAP_SRC,&Click_Data);

  if(Click_Data >= 0x60)
  {
    NRF_LOG_INFO("single click \n");
    return GET_ERROR ; 
  }
  else if(Click_Data >= 0x8)
  {
    NRF_LOG_INFO("double click \n");
    return GET_SUCCE;
  }
  else
  {
    NRF_LOG_INFO("not  click found :%d \n",Click_Data);
    return GET_SUCCE ; 
  }
}

//从低功耗转换成高性能或从高性能转为低功耗                    INT1    阀值为   62.5   mg = (2 * FS /64 )
void LIS2DW_Check_Alive_Int1()
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x50); //启动加速计     ODR = 200HZ ,FS = +-2g 
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,0x2); //设置不活动检测的持续时间
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x42); //设置活动不活动检测阀值
  set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x20); //活动中断驱动至      INT1引脚
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0X20); //使能中断

}


//从低功耗转换成高性能或从高性能转为低功耗                    INT2   阀值为   62.5   mg = (2 * FS /64 )
void LIS2DW_Check_Alive_Int2()
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x50); //启动加速计     ODR = 200HZ ,FS = +-2g 
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,0x2); //设置不活动检测的持续时间
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x42); //设置活动不活动检测阀值
  set_Reg_LIS2DE(LIS2DW12_CTRL5_INT2_PAD_CTRL,0x20); //活动中断驱动至      INT2引脚
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0X20); //使能中断

}


//自检

/*1.使能加速计    
  2.启动自检之前,对5个样本取平均
  3.启动自检后,对5个样本取平均   
  4.计算每个轴的绝对值，并验证它是否处于给定的范围内
  */

bool LIS2DW12_StartSelfTest(void)
{

    ARW_XYZ First_Avg_Data , Last_Avg_Data , Temp_Data ; 
    First_Avg_Data.ARW_X = 0 ;
    First_Avg_Data.ARW_Y = 0 ;
    First_Avg_Data.ARW_Z = 0 ;
    //first: enable LIS2DW set work-mode
    set_Reg_LIS2DE(LIS2DW12_CTRL2,0x08);  
    set_Reg_LIS2DE(LIS2DW12_CTRL3,0x00);
    set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x00);
    set_Reg_LIS2DE(LIS2DW12_CTRL5_INT2_PAD_CTRL,0x00);
    set_Reg_LIS2DE(LIS2DW12_CTRL6,0x10);
    set_Reg_LIS2DE(LIS2DW12_CTRL1,0x20);        //开启高性能      ODR = 50HZ ， FS = 4g  BDU =1  , 关闭中断信号

    nrf_delay_ms(100) ; //等待100  ms


    //second: start First Get Data

    for(int i = 0 ; i< 6 ; i++)
    {
      uint8_t response = LIS2DW12_Get_Pos_AxesRaw(&Temp_Data);
      if(response)
      {
        NRF_LOG_INFO("self test LIS2DW12_Get_Pos_AxesRaw Failed\n");
        return false ; 
      }

      if(i == 0 )
      {
        continue ; //丢弃第一个样本
      }
      First_Avg_Data.ARW_X += Temp_Data.ARW_X ; 
      First_Avg_Data.ARW_Y += Temp_Data.ARW_Y ; 
      First_Avg_Data.ARW_Z += Temp_Data.ARW_Z ; 
    }
    First_Avg_Data.ARW_X = First_Avg_Data.ARW_X / 5 ; 
    First_Avg_Data.ARW_Y = First_Avg_Data.ARW_Y / 5 ; 
    First_Avg_Data.ARW_Z = First_Avg_Data.ARW_Z / 5 ;
    
    //NRF_LOG_INFO(" First Avg Data :  X :%d   Y :%d   Z %d\n",First_Avg_Data.ARW_X,First_Avg_Data.ARW_Y,First_Avg_Data.ARW_Z);
    
    set_Reg_LIS2DE(LIS2DW12_CTRL3,0x40);
    
    nrf_delay_ms(100);//等待  DRDY 信号

    //third : start Last Get Data 

    Last_Avg_Data.ARW_X = 0 ;
    Last_Avg_Data.ARW_Y = 0 ;
    Last_Avg_Data.ARW_Z = 0 ;

    for(int i = 0 ; i< 6 ; i++)
    {
      uint8_t response = LIS2DW12_Get_Pos_AxesRaw(&Temp_Data);
      if(response)
      {
        NRF_LOG_INFO("self test LIS2DW12_Get_Pos_AxesRaw Failed\n");
        return false ; 
      }

      if(i == 0 )
      {
        continue ; //丢弃第一个样本
      }
      Last_Avg_Data.ARW_X += Temp_Data.ARW_X ; 
      Last_Avg_Data.ARW_Y += Temp_Data.ARW_Y ; 
      Last_Avg_Data.ARW_Z += Temp_Data.ARW_Z ; 
    }
  Last_Avg_Data.ARW_X = Last_Avg_Data.ARW_X / 5 ; 
  Last_Avg_Data.ARW_Y = Last_Avg_Data.ARW_Y / 5 ; 
  Last_Avg_Data.ARW_Z = Last_Avg_Data.ARW_Z / 5 ;

  //NRF_LOG_INFO(" Last Avg Data :  X :%d   Y :%d   Z %d\n",Last_Avg_Data.ARW_X,Last_Avg_Data.ARW_Y,Last_Avg_Data.ARW_Z);

  int16_t X_Mid_Data = abs(First_Avg_Data.ARW_X - Last_Avg_Data.ARW_X);
  int16_t Y_Mid_Data = abs(First_Avg_Data.ARW_Y - Last_Avg_Data.ARW_Y);
  int16_t Z_Mid_Data = abs(First_Avg_Data.ARW_Z - Last_Avg_Data.ARW_Z);
  
  //Last shut sensor
  if((X_Mid_Data <= 0 || X_Mid_Data >= 900) || (Y_Mid_Data <=0 || Y_Mid_Data >= 900) || (Z_Mid_Data<=0 || Z_Mid_Data >=900))
  {
    NRF_LOG_INFO("LIS2DW12 Self Test Failed : X: %d Y: %d Z: %d",X_Mid_Data,Y_Mid_Data,Z_Mid_Data);
    set_Reg_LIS2DE(LIS2DW12_CTRL1,0x00);
    set_Reg_LIS2DE(LIS2DW12_CTRL3,0x00);

    return false ; 
  }
  NRF_LOG_INFO("LIS2DW12 Self Test Succue : X: %d Y: %d Z: %d",X_Mid_Data,Y_Mid_Data,Z_Mid_Data);
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x00);
  set_Reg_LIS2DE(LIS2DW12_CTRL3,0x00);

  return true ; 
}


//重置传感器
void LIS2DW12_SoftReset()
{
  //set_Reg_LIS2DE(LIS2DW12_CTRL1,0x00);
  //nrf_delay_ms(10);
  //set_Reg_LIS2DE(LIS2DW12_CTRL1,0x12); 
  set_Reg_LIS2DE(LIS2DW12_CTRL2,0x40);
  nrf_delay_ms(5);
}



//关闭传感器
void LIS2DW12_SensorStop()
{
  uint8_t INTREL = 0  ; 
  if((LIS2DW12_Get_Int1Src(&INTREL) !=0) || (LIS2DW12_Get_Int2Src(&INTREL) !=0))
  {
    NRF_LOG_INFO("LIS2DW12 stop error\n");
  }
  set_Reg_LIS2DE(LIS2DW12_CTRL3,0x00);
  
  set_Reg_LIS2DE(LIS2DW12_CTRL6,0x00);
  
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0x00);
  
  set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x00);
 
  set_Reg_LIS2DE(LIS2DW12_CTRL5_INT2_PAD_CTRL,0x00);
  
  set_Reg_LIS2DE(LIS2DW12_CTRL2,0x00);
  
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x00); 
}





//自由落体
/*
	FREE_FALL[2]:FREE_FALL[0]设置阀值
	000  156mg    001   219mg   010   250mg   011  312mg  100  344mg   101   406mg   110 469mg   111 500mg
*/
void LIS2DW12_Free_FALL(uint8_t fall_timer,uint8_t nDuration)
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x74);                      //启动加速计  高性能        ODR=200Hz
  
  set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04);                      //使能  FS +-2g LOW_NOISE
  
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,fall_timer);                //设置事件持续时间
  
  set_Reg_LIS2DE(LIS2DW12_FREE_FALL,nDuration);                  //设置阀值
  
  set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x10);        //中断驱动至     INT1
  
  set_Reg_LIS2DE(LIS2DW12_CTRL3,0x10);                      //锁存中断
  
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20);                      //使能中断

}

//当产生自由落体中断时可以读取中断信号解锁或者读                     取WAKE_UP_SRC  

void LIS2DW12_Check_Fall()
{
	
	uint8_t Click_Fall_Data = 0 ;
	LIS2DW_ReadReg(LIS2DW12_WAKE_UP_SRC,&Click_Fall_Data);
	NRF_LOG_INFO("FALL DATA:%d\n",Click_Fall_Data);
}


//通过滤波器唤醒事件

void LIS2DW12_Wake_Event()
{
   set_Reg_LIS2DE(LIS2DW12_CTRL1,0x64);                     //启动加速计  高性能        ODR=200Hz
   set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04);                     //使能  FS +-2g LOW_NOISEZ
   set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20);                     //使用  HP滤波器   使能中断
   set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,0x00);               //无持续
   set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x20);               //设置唤醒阀值
   set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x20);       //唤醒中断驱动至       INT1引脚
}

/*
                                    LIS2DW_TAP_THS_X


      4D_EN    6D_THS1   6D_THS0   TAP_THSX4  TAP_THSX3    TAP_THSX2  TAP_THSX1  TAP_THSX0  
 
  
  //启动 4D    6D_THS1 和 6D_THS0    控制阀值大小      00表示使用4D ,10,01,11表示使用6D并表示阀值大小    

	TAP_THSX3:TAP_THSX0  控制阀值大小
*/

//设置移动状态      (6/4)     
uint8_t  LIS2DW12_Set_Motion_Detection(uint8_t ord , uint8_t accRange , uint8_t nDuration)  //nDuration 小于0  x80表示使用    D6
{
  if(ord != LIS2DW12_ORD_50Hz && ord != LIS2DW12_ORD_100Hz && ord !=LIS2DW12_ORD_25Hz)
  {
    ord = LIS2DW12_ORD_50Hz ; 
  }
  set_Reg_LIS2DE(LIS2DW12_CTRL1,ord);                      //启动加速计  高性能        ODR=50Hz
  
  set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04);                      //使能  FS +-2g LOW_NOISEZ
  
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20);                      //请勿在 6   D中使用低通滤波器,使能中断
  
  set_Reg_LIS2DE(LIS2DW12_TAP_THS_X,nDuration);             //设置6  D 阀值             
  
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,accRange);            //设置检测时长
  
  set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x80);        //6D中断驱动至     INT1引脚

  return GET_SUCCE ;
}


/*
    SIXD_SRC
    0   6D_IA   ZH  ZL  YH  YL  XH  XL
*/

//获取移动状态
uint8_t LIS2DW12_Get_Motion_Detection()
{ 
   uint8_t Mot_Data  = 0 ; 
  LIS2DW_ReadReg(LIS2DW12_SIXD_SRC,&Mot_Data);
  if(Mot_Data == 0)
  {
    NRF_LOG_INFO("no enabled motion detection\n");
    return GET_ERROR ; 
  }
  NRF_LOG_INFO("Get Motion Detection :%d \n",Mot_Data);
  return GET_SUCCE ; 

}



float GET_TEMP_DATA()
{
  uint8_t head_temp = 0 , laster_temp = 0 ; 

  LIS2DW_ReadReg(LIS2DW12_OUT_T_H,&head_temp);
  LIS2DW_ReadReg(LIS2DW12_OUT_T_L,&laster_temp); 

  float temp = (float)(head_temp << 8 | laster_temp);

  temp = 25.0 + temp /16.0/16.0 ; 
  //temp *= 100 ; 
  return temp ; 

}



int16_t Get_X_LIS2DW12()
{
  int16_t value = 0 ; 

  uint8_t *valueL = (uint8_t *)(&value);
  uint8_t *valueH = ((uint8_t *)(&value)+1);
  LIS2DW_ReadReg(LIS2DW12_OUT_X_H,valueH);
  LIS2DW_ReadReg(LIS2DW12_OUT_X_L,valueL);


  return value ; 
}

int16_t Get_Y_LIS2DW12(void)
{
   int16_t value = 0 ; 

  uint8_t *valueL = (uint8_t *)(&value);
  uint8_t *valueH = ((uint8_t *)(&value)+1);
  LIS2DW_ReadReg(LIS2DW12_OUT_Y_H,valueH);
  LIS2DW_ReadReg(LIS2DW12_OUT_Y_L,valueL);

  return value ;
}

int16_t Get_Z_LIS2DW12(void)
{
 
  int16_t value = 0 ; 

  uint8_t *valueL = (uint8_t *)(&value);
  uint8_t *valueH = ((uint8_t *)(&value)+1);
  LIS2DW_ReadReg(LIS2DW12_OUT_Z_H,valueH);
  LIS2DW_ReadReg(LIS2DW12_OUT_Z_L,valueL);

  
  return value ; 
}



//获取中断引脚1
uint8_t LIS2DW12_Get_Int1Src(uint8_t *val)
{
  uint8_t INT_REL = 0 ; 
  LIS2DW_ReadReg(LIS2DW12_CTRL4_INT1_PAD_CTRL,val);
  
 
  if(!LIS2DW_ReadReg(LIS2DW12_CTRL4_INT1_PAD_CTRL,&INT_REL))
  {
    NRF_LOG_INFO("INT1 Not found data\n");
    return GET_ERROR;
  }
  NRF_LOG_INFO("INT1 DATA :%d\n",INT_REL);
  return GET_SUCCE ;
}

//获取中断引脚2
uint8_t LIS2DW12_Get_Int2Src(uint8_t *val)
{
  uint8_t INT_REL = 0 ; 
  LIS2DW_ReadReg(LIS2DW12_CTRL5_INT2_PAD_CTRL,val);


  if(!LIS2DW_ReadReg(LIS2DW12_CTRL5_INT2_PAD_CTRL,&INT_REL))
  {
    NRF_LOG_INFO("INT2 not found data\n");
    return GET_ERROR;
  }
  NRF_LOG_INFO("INT2 DATA :%d\n",INT_REL);
  return GET_SUCCE ;
}

#endif