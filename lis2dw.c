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



//��ʼ��
void LIS2DW12_PosEnable()
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x11);                      //1.6   HZ �͹���   14λ�ֱ���
  
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0x10);                      //���ж�ʹ��������
  
  //set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x7F);        //��Ҫ���ж��ź�д���жϼĴ����Ż��ж�Ӧ���ж��ź�
  //set_Reg_LIS2DE(LIS2DW12_CTRL5_INT2_PAD_CTRL,0x7F);
  
  NRF_LOG_INFO("LIS2DW sensor enable\n");
}


//��ȡ  ���ټƵ�ֵ

//�ɹ����� 0 ���ɹ����� 1
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

//����
uint8_t LIS2DW12_Single_Click(uint8_t X_Duration,uint8_t Y_Duration , uint8_t Z_Duration)
{
  if(!set_Reg_LIS2DE(LIS2DW12_CTRL1,0x71))  //�������ټ�      ,     ODM = 200 HZ , ������
  {
    NRF_LOG_INFO("start lis2dw failed\n");
    return GET_ERROR ; 
  }

  if(!set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04)) // ʹ��  FS +- 2g LOW_NOISE 
  {
    NRF_LOG_INFO("enable lis2dw failed\n");
    return GET_ERROR ; 
  }

  if(!set_Reg_LIS2DE(LIS2DW12_TAP_THS_X,X_Duration)) //����  X��ĵ����ֵ       
  {
    NRF_LOG_INFO("set Single X failed\n");
    return GET_ERROR ;
  }
  
  if(!set_Reg_LIS2DE(LIS2DW12_TAP_THS_Y,0xE0 +Y_Duration )) //����  Y��ĵ����ֵ  0xE0 ��ʾʹ��X Y Z ����¼� 
  if(!set_Reg_LIS2DE(LIS2DW12_TAP_THS_Y,0xE0 +Z_Duration)) //����  Y��ĵ����ֵ   0xE0 ��ʾʹ��X Y Z ����¼� 
  {
    NRF_LOG_INFO("set Single Y failed\n");
    return GET_ERROR ; 
  }

  if(!set_Reg_LIS2DE(LIS2DW12_TAP_THS_Z,0xE9)) //����  Z��ĵ����ֵ
  {
    NRF_LOG_INFO("set Single Z failed\n");
    return GET_ERROR ; 
  }
  
  if(!set_Reg_LIS2DE(LIS2DW12_INT_DUR,0x06)) // ����   quiet ��  shock ʱ�䴰�� 
  {
    NRF_LOG_INFO("set single shock timer failed\n");
    return GET_ERROR ; 
  }
  
  if(!set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x00)) //ֻʹ�ܵ���
  {
     NRF_LOG_INFO("enable single failed\n");
     return GET_ERROR ; 
  }
  
  if(!set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x40)) //�����ж�������       INT1 ����
  {
    NRF_LOG_INFO("enabled INT1 failed\n");
    return GET_ERROR ; 
  }
 
  if(!set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20)) //ʹ���ж�
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

//������˫�����ʹ�ø�ͨ�˲���,��Ҫʹ�ø����ܵļ��ټ�
uint8_t LIS2DW12_Double_Click(uint8_t X_Duration,uint8_t Y_Duration , uint8_t Z_Duration)
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x71);  //�������ټ�      ,     ODM = 200 HZ , ������    

  set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04); // ʹ��  FS +- 2g LOW_NOISE 


  set_Reg_LIS2DE(LIS2DW12_TAP_THS_X,X_Duration); //����  X��ĵ����ֵ         

  set_Reg_LIS2DE(LIS2DW12_TAP_THS_Y,0xE0 + Y_Duration ); //����  Y��ĵ����ֵ   0xE0 ��ʾʹ��X Y Z ����¼�     

  set_Reg_LIS2DE(LIS2DW12_TAP_THS_Z,0xE0 + Z_Duration); //����  Z��ĵ����ֵ    0xE0 ��ʾʹ��X Y Z ����¼� 

  set_Reg_LIS2DE(LIS2DW12_INT_DUR,0x7F); // ����   quiet ��  shock ʱ�䴰��      INT_DUR QUIET�ֶβ�Ϊ0��ʾ����ģʽ����

  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x80); //ʹ�ܵ�����˫��

  set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x8); //˫���ж�������       INT1 ����


  set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20); //ʹ���ж�

  return GET_SUCCE ; 

}

/*
	TAP_SRC:
	
	0 	TAP_IA	SINGLE_TAP	DOUBLE_TAP	TAP_SIGN	X_TAP	Y_TAP	Z_TAP
	
	����⵽������˫���¼�ʱ,TAP_IAΪ1
	����⵽����ʱ,SINGLE_TAPΪ1
	����⵽˫��ʱ,DOUBLEΪ1
	TAP_SIGNָʾ��⵽����¼�ʱ�ļ��ٶȷ���,����Ϊ��ʱ��Ϊ0,����Ϊ��ʱ��Ϊ1

        ALL_INT_SRC:
        0   0         sleep_change_ia     6d_ia     double_tap    single_tap    wu_ia     ff_ia

        //�������ּĴ��������Լ�ⵥ������˫��
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

//�ӵ͹���ת���ɸ����ܻ�Ӹ�����תΪ�͹���                    INT1    ��ֵΪ   62.5   mg = (2 * FS /64 )
void LIS2DW_Check_Alive_Int1()
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x50); //�������ټ�     ODR = 200HZ ,FS = +-2g 
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,0x2); //���ò�����ĳ���ʱ��
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x42); //���û�����ֵⷧ
  set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x20); //��ж�������      INT1����
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0X20); //ʹ���ж�

}


//�ӵ͹���ת���ɸ����ܻ�Ӹ�����תΪ�͹���                    INT2   ��ֵΪ   62.5   mg = (2 * FS /64 )
void LIS2DW_Check_Alive_Int2()
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x50); //�������ټ�     ODR = 200HZ ,FS = +-2g 
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,0x2); //���ò�����ĳ���ʱ��
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x42); //���û�����ֵⷧ
  set_Reg_LIS2DE(LIS2DW12_CTRL5_INT2_PAD_CTRL,0x20); //��ж�������      INT2����
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0X20); //ʹ���ж�

}


//�Լ�

/*1.ʹ�ܼ��ټ�    
  2.�����Լ�֮ǰ,��5������ȡƽ��
  3.�����Լ��,��5������ȡƽ��   
  4.����ÿ����ľ���ֵ������֤���Ƿ��ڸ����ķ�Χ��
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
    set_Reg_LIS2DE(LIS2DW12_CTRL1,0x20);        //����������      ODR = 50HZ �� FS = 4g  BDU =1  , �ر��ж��ź�

    nrf_delay_ms(100) ; //�ȴ�100  ms


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
        continue ; //������һ������
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
    
    nrf_delay_ms(100);//�ȴ�  DRDY �ź�

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
        continue ; //������һ������
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


//���ô�����
void LIS2DW12_SoftReset()
{
  //set_Reg_LIS2DE(LIS2DW12_CTRL1,0x00);
  //nrf_delay_ms(10);
  //set_Reg_LIS2DE(LIS2DW12_CTRL1,0x12); 
  set_Reg_LIS2DE(LIS2DW12_CTRL2,0x40);
  nrf_delay_ms(5);
}



//�رմ�����
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





//��������
/*
	FREE_FALL[2]:FREE_FALL[0]���÷�ֵ
	000  156mg    001   219mg   010   250mg   011  312mg  100  344mg   101   406mg   110 469mg   111 500mg
*/
void LIS2DW12_Free_FALL(uint8_t fall_timer,uint8_t nDuration)
{
  set_Reg_LIS2DE(LIS2DW12_CTRL1,0x74);                      //�������ټ�  ������        ODR=200Hz
  
  set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04);                      //ʹ��  FS +-2g LOW_NOISE
  
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,fall_timer);                //�����¼�����ʱ��
  
  set_Reg_LIS2DE(LIS2DW12_FREE_FALL,nDuration);                  //���÷�ֵ
  
  set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x10);        //�ж�������     INT1
  
  set_Reg_LIS2DE(LIS2DW12_CTRL3,0x10);                      //�����ж�
  
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20);                      //ʹ���ж�

}

//���������������ж�ʱ���Զ�ȡ�ж��źŽ������߶�                     ȡWAKE_UP_SRC  

void LIS2DW12_Check_Fall()
{
	
	uint8_t Click_Fall_Data = 0 ;
	LIS2DW_ReadReg(LIS2DW12_WAKE_UP_SRC,&Click_Fall_Data);
	NRF_LOG_INFO("FALL DATA:%d\n",Click_Fall_Data);
}


//ͨ���˲��������¼�

void LIS2DW12_Wake_Event()
{
   set_Reg_LIS2DE(LIS2DW12_CTRL1,0x64);                     //�������ټ�  ������        ODR=200Hz
   set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04);                     //ʹ��  FS +-2g LOW_NOISEZ
   set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20);                     //ʹ��  HP�˲���   ʹ���ж�
   set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,0x00);               //�޳���
   set_Reg_LIS2DE(LIS2DW12_WAKE_UP_THS,0x20);               //���û��ѷ�ֵ
   set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x20);       //�����ж�������       INT1����
}

/*
                                    LIS2DW_TAP_THS_X


      4D_EN    6D_THS1   6D_THS0   TAP_THSX4  TAP_THSX3    TAP_THSX2  TAP_THSX1  TAP_THSX0  
 
  
  //���� 4D    6D_THS1 �� 6D_THS0    ���Ʒ�ֵ��С      00��ʾʹ��4D ,10,01,11��ʾʹ��6D����ʾ��ֵ��С    

	TAP_THSX3:TAP_THSX0  ���Ʒ�ֵ��С
*/

//�����ƶ�״̬      (6/4)     
uint8_t  LIS2DW12_Set_Motion_Detection(uint8_t ord , uint8_t accRange , uint8_t nDuration)  //nDuration С��0  x80��ʾʹ��    D6
{
  if(ord != LIS2DW12_ORD_50Hz && ord != LIS2DW12_ORD_100Hz && ord !=LIS2DW12_ORD_25Hz)
  {
    ord = LIS2DW12_ORD_50Hz ; 
  }
  set_Reg_LIS2DE(LIS2DW12_CTRL1,ord);                      //�������ټ�  ������        ODR=50Hz
  
  set_Reg_LIS2DE(LIS2DW12_CTRL6,0x04);                      //ʹ��  FS +-2g LOW_NOISEZ
  
  set_Reg_LIS2DE(LIS2DW12_CTRL7,0x20);                      //������ 6   D��ʹ�õ�ͨ�˲���,ʹ���ж�
  
  set_Reg_LIS2DE(LIS2DW12_TAP_THS_X,nDuration);             //����6  D ��ֵ             
  
  set_Reg_LIS2DE(LIS2DW12_WAKE_UP_DUR,accRange);            //���ü��ʱ��
  
  set_Reg_LIS2DE(LIS2DW12_CTRL4_INT1_PAD_CTRL,0x80);        //6D�ж�������     INT1����

  return GET_SUCCE ;
}


/*
    SIXD_SRC
    0   6D_IA   ZH  ZL  YH  YL  XH  XL
*/

//��ȡ�ƶ�״̬
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



//��ȡ�ж�����1
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

//��ȡ�ж�����2
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