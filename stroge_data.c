#ifndef TEMP_FRON_SHT
#include <stdio.h>
#include <stdint.h>
#include <float.h>
#include "nrf_log.h"
#include "stroge_data.h"
#define  DETLA_TEMPERATURE 40
typedef  struct storget{

  uint16_t temp_data ; 
  uint32_t adc_to_temp_data ; 
  uint32_t between_two_value_defference ; 
}storget_data ; 


static storget_data gap_target_data[]={
{1	,9837	,46},
{2	,9791	,47},
{3	,9744	,48},
{4	,9696	,48},
{5	,9648	,49},
{6	,9599	,49},
{7	,9550	,50},
{8	,9500	,50},
{9	,9450	,51},
{10	,9399	,51},
{11	,9348	,52},
{12	,9296	,52},
{13	,9244	,53},
{14	,9191	,54},
{15	,9137	,56},
{16	,9081	,56},
{17	,9025	,58},
{18	,8967	,58},
{19	,8909	,59},
{20	,8850	,61},
{21	,8789	,61},
{22	,8728	,62},
{23	,8666	,62},
{24	,8604	,63},
{25	,8541	,64},
{26	,8477	,65},
{27	,8412	,66},
{28	,8346	,67},
{29	,8273	,71},
{30	,8202	,73},
{31	,8129	,74},
{32	,8055	,76},
{33	,7979	,78},
{34	,7822	,79},
{35	,7742	,80},
{36	,7660	,82},
{37	,7577	,83},
{38	,7492	,85},
{39	,7406	,86},
{40	,7319	,87},
{41	,7231	,88},
{42	,7141	,90},
{43	,7050	,91},
{44	,6958	,92},
{45	,6866	,92},
{46	,6774	,93},
{47	,6681	,93},
{48	,6588	,93},
{49	,6495	,93},
{50	,6402	,93},
{51	,6309	,93},
{52	,6216	,94},
{53	,6122	,94},
{54	,6028	,94},
{55	,5934	,94},
{56	,5840	,94},
{57	,5746	,94},
{58	,5652	,94},
{59	,5558	,94},
{60	,5464	,93},
{61	,5371	,93},
{62	,5278	,93},
{63	,5185	,93},
{64	,5092	,93},
{65	,4999	,93},
{66	,4906	,92},
{67	,4814	,92},
{68	,4722	,92},
{69	,4666	,92},
{70	,4574	,92},
{71	,4482	,92},
{72	,4371	,92},
{73	,4277	,92},
{74	,4184	,92},
{75	,4092	,92},
{76	,4002	,90},
{77	,3916	,86},
{78	,3832	,84},
{79	,3750	,82},
{80	,3669	,81},
{81	,3589	,80},
{82	,3510	,79},
{83	,3432	,78},
{84	,3354	,78},
{85	,3277	,77},
{86	,3209	,77},
{87	,3132	,77},
{88	,3056	,76},
{89	,2981	,75},
{90	,2907	,74},
{91	,2834	,73},
{92	,2762	,72},
{93	,2691	,71},
{94	,2621	,70},
{95	,2552	,69},
{96	,2484	,68},
{97	,2417	,67},
{98	,2351	,66},
{99	,2286	,65},
{100	,2222	,64},
{101	,2159	,63},
{102	,2097	,62},
{103	,2034	,63},
{104	,1972	,62},
{105	,1912	,60},
{106	,1854	,59},
{107	,1797	,58},
{108	,1741	,56},
{109	,1686	,55},
{110	,1632	,54},
{111	,1579	,53},
{112	,1527	,52},
{113	,1476	,51},
{114	,1426	,50},
{115	,1377	,49},
{116	,1329	,48},
{117	,1282	,47},
{118	,1236	,46},
{119	,1191	,45},
{120	,1147	,44},

}; 


static float adc_value_to_temp_situation(uint32_t big_measure_value , uint32_t small_measure_value ,uint16_t samle_value_temp,float target);
float search_data(float target)
{
  //target *100 ; 
   uint32_t target_val = (uint32_t)target; 

  //int 
   int left = 0 ;
   int right = sizeof(gap_target_data) / sizeof(gap_target_data[0]) -1 ;
   while(left < right)
   {
      int mid = (left + right) /2 ;
       uint32_t res = gap_target_data[mid].adc_to_temp_data;
      if(target_val == res)
      {
        return gap_target_data[mid].temp_data - DETLA_TEMPERATURE ; 
        
      }
      //当前值大于目标值并且下一个值小于目标值
      else if(gap_target_data[mid].adc_to_temp_data > target_val && gap_target_data[mid+1].adc_to_temp_data < target_val)
      {
        //printf("two temp,temp1 :%d,temp2:%d\n",gap_target_data[mid].temp_data ,gap_target_data[mid+1].temp_data );

        return adc_value_to_temp_situation(gap_target_data[mid].adc_to_temp_data,gap_target_data[mid+1].adc_to_temp_data,gap_target_data[mid].temp_data,target_val);
      }
      //当前值小于目标值并且上一个值大于目标值
      else if(gap_target_data[mid].adc_to_temp_data < target_val && gap_target_data[mid-1].adc_to_temp_data > target_val)
      {
        //printf("two temp_value , value1:%d,value2:%d\n",gap_target_data[mid-1].temp_data,gap_target_data[mid].temp_data);
        
        return adc_value_to_temp_situation(gap_target_data[mid-1].adc_to_temp_data,gap_target_data[mid].adc_to_temp_data,gap_target_data[mid-1].temp_data,target_val);
      }
      else if(gap_target_data[mid].adc_to_temp_data > target_val)
      {
        left = mid +1 ; 
      }
      else 
      {
        right = mid  ; 
      }
   }
}

//number1 > number2 and number1 > target , number2 < target , val == number1.temp

//onec situation
static float adc_value_to_temp_situation(uint32_t big_measure_value , uint32_t small_measure_value ,uint16_t samle_value_temp,float target)
{
  float ans =(1.0-((float)(target - small_measure_value))/(float)((big_measure_value - small_measure_value)))+ samle_value_temp - DETLA_TEMPERATURE ;
  //NRF_LOG_INFO("measure temp value :%d\n",(int)(ans * 100)); 
  return ans ; 
}

#endif

