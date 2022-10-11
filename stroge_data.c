
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

#ifdef  TDK
static storget_data gap_target_data[]={
{0	,9500	,23 },
{1	,9477	,26 },
{2	,9451	,28 },
{3	,9423	,31 },
{4	,9391	,35 },
{5	,9356	,29 },
{6	,9328	,32 },
{7	,9296	,35 },
{8	,9261	,38 },
{9	,9223	,42 },
{10	,9181	,35 },
{11	,9146	,38 },
{12	,9108	,42 },
{13	,9066	,46 },
{14	,9020	,51 },
{15	,8970	,42 },
{16	,8928	,45 },
{17	,8882	,49 },
{18	,8833	,54 },
{19	,8779	,59 },
{20	,8720	,49 },
{21	,8670	,53 },
{22	,8617	,57 },
{23	,8560	,62 },
{24	,8497	,68 },
{25	,8429	,57 },
{26	,8373	,61 },
{27	,8312	,66 },
{28	,8246	,71 },
{29	,8175	,77 },
{30	,8098	,64 },
{31	,8034	,69 },
{32	,7965	,74 },
{33	,7892	,79 },
{34	,7813	,85 },
{35	,7727	,71 },
{36	,7656	,76 },
{37	,7581	,81 },
{38	,7500	,86 },
{39	,7413	,93 },
{40	,7321	,77 },
{41	,7244	,82 },
{42	,7162	,87 },
{43	,7075	,92 },
{44	,6983	,98 },
{45	,6884	,82 },
{46	,6802	,87 },
{47	,6716	,91 },
{48	,6624	,97 },
{49	,6527	,102},
{50	,6425	,86 },
{51	,6340	,90 },
{52	,6250	,94 },
{53	,6155	,99 },
{54	,6056	,104},
{55	,5952	,87 },
{56	,5865	,91 },
{57	,5773	,95 },
{58	,5678	,100},
{59	,5578	,104},
{60	,5474	,87 },
{61	,5386	,91 },
{62	,5295	,95 },
{63	,5201	,98 },
{64	,5103	,103},
{65	,5000	,86 },
{66	,4914	,89 },
{67	,4825	,92 },
{68	,4733	,95 },
{69	,4638	,99 },
{70	,4539	,83 },
{71	,4456	,85 },
{72	,4370	,88 },
{73	,4282	,91 },
{74	,4191	,94 },
{75	,4097	,79 },
{76	,4019	,81 },
{77	,3938	,83 },
{78	,3854	,85 },
{79	,3769	,88 },
{80	,3681	,74 },
{81	,3607	,76 },
{82	,3532	,77 },
{83	,3454	,79 },
{84	,3375	,81 },
{85	,3294	,68 },
{86	,3225	,70 },
{87	,3155	,71 },
{88	,3084	,73 },
{89	,3011	,74 },
{90	,2937	,63 },
{91	,2875	,64 },
{92	,2811	,65 },
{93	,2746	,66 },
{94	,2680	,67 },
{95	,2613	,57 },
{96	,2556	,58 },
{97	,2498	,59 },
{98	,2439	,60 },
{99	,2380	,60 },
{100	,2319	,18 },
{101	,2301	,51 },
{102	,2249	,52 },
{103	,2197	,53 },
{104	,2145	,88 },
{105	,2056	,46 },
{106	,2011	,47 },
{107	,1964	,47 },
{108	,1917	,47 },
{109	,1870	,48 },
{110	,1822	,41 },
{111	,1781	,41 },
{112	,1740	,42 },
{113	,1698	,42 },
{114	,1656	,42 },
{115	,1614	,36 },
{116	,1578	,37 },
{117	,1541	,37 },
{118	,1504	,37 },
{119	,1467	,37 },
{120	,1430	,37 },

}; 
#endif
#ifdef  ASD1115
static storget_data gap_target_data[]={
{0	,9703	,19  },
{1	,9684	,20  },
{2	,9663	,22  },
{3	,9642	,23  },
{4	,9619	,24  },
{5	,9595	,25  },
{6	,9570	,27  },
{7	,9543	,28  },
{8	,9515	,29  },
{9	,9486	,31  },
{10	,9455	,32  },
{11	,9422	,34  },
{12	,9388	,36  },
{13	,9353	,37  },
{14	,9316	,39  },
{15	,9277	,41  },
{16	,9236	,43  },
{17	,9193	,44  },
{18	,9149	,46  },
{19	,9103	,48  },
{20	,9055	,50  },
{21	,9005	,52  },
{22	,8952	,54  },
{23	,8898	,56  },
{24	,8842	,58  },
{25	,8783	,61  },
{26	,8723	,63  },
{27	,8660	,65  },
{28	,8595	,67  },
{29	,8528	,69  },
{30	,8459	,71  },
{31	,8388	,74  },
{32	,8314	,76  },
{33	,8238	,78  },
{34	,8160	,80  },
{35	,8080	,82  },
{36	,7998	,84  },
{37	,7914	,86  },
{38	,7827	,88  },
{39	,7739	,90  },
{40	,7649	,92  },
{41	,7557	,94  },
{42	,7463	,96  },
{43	,7367	,98  },
{44	,7269	,99  },
{45	,7170	,101 },
{46	,7069	,102 },
{47	,6967	,103 },
{48	,6864	,105 },
{49	,6759	,106 },
{50	,6653	,107 },
{51	,6546	,108 },
{52	,6438	,109 },
{53	,6329	,110 },
{54	,6220	,110 },
{55	,6110	,111 },
{56	,5999	,111 },
{57	,5888	,111 },
{58	,5777	,111 },
{59	,5665	,111 },
{60	,5554	,111 },
{61	,5443	,111 },
{62	,5331	,111 },
{63	,5220	,110 },
{64	,5110	,110 },
{65	,5000	,109 },
{66	,4891	,109 },
{67	,4782	,108 },
{68	,4674	,107 },
{69	,4567	,106 },
{70	,4461	,105 },
{71	,4356	,104 },
{72	,4253	,103 },
{73	,4150	,101 },
{74	,4049	,100 },
{75	,3949	,98  },
{76	,3851	,97  },
{77	,3754	,95  },
{78	,3658	,94  },
{79	,3564	,92  },
{80	,3472	,91  },
{81	,3381	,89  },
{82	,3292	,87  },
{83	,3205	,86  },
{84	,3119	,84  },
{85	,3035	,82  },
{86	,2953	,81  },
{87	,2872	,79  },
{88	,2794	,77  },
{89	,2717	,75  },
{90	,2641	,74  },
{91	,2568	,72  },
{92	,2496	,70  },
{93	,2426	,68  },
{94	,2358	,67  },
{95	,2291	,65  },
{96	,2226	,63  },
{97	,2162	,62  },
{98	,2101	,60  },
{99	,2041	,59  },
{100 ,1982	,57  },
{101 ,1925	,55  },
{102 ,1870	,54  },
{103 ,1816	,52  },
{104 ,1763	,51  },
{105 ,1712	,50  },
{106 ,1663	,48  },
{107 ,1615	,47  },
{108 ,1568	,45  },
{109 ,1522	,44  },
{110 ,1478	,43  },
{111 ,1435	,42  },
{112 ,1394	,40  },
{113 ,1353	,39  },
{114 ,1314	,38  },
{115 ,1276	,37  },
{116 ,1239	,36  },
{117 ,1203	,35  },
{118 ,1168	,34  },
{119 ,1135	,33  },
{120 ,1102	,32  },
{121 ,1070	,31  },
{122 ,1039	,30  },
{123 ,1010	,29  },
{124 ,981	,28  },
{125 ,953	,27  },
{126 ,925	,26  },
{127 ,899	,26  },
{128 ,873	,25  },
{129 ,848	,24  },
{130 ,824	,23  },
{131 ,801	,23  },
{132 ,778	,22  },
{133 ,757	,21  },
{134 ,735	,21  },
{135 ,715	,20  },
{136 ,695	,19  },
{137 ,675	,19  },
{138 ,657	,18  },
{139 ,638	,18  },
{140 ,621	,18  },
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

#ifdef K6PB_DIF
static storget_data gap_target_data[]={
{0,297,-19  },
{1,316,-20  },
{2,337,-22  },
{3,358,-23  },
{4,381,-24  },
{5,405,-25  },
{6,430,-27  },
{7,457,-28  },
{8,485,-29  },
{9,514,-31  },
{10,545,-32  },
{11,578,-34  },
{12,612,-36  },
{13,647,-37  },
{14,684,-39  },
{15,723,-41  },
{16,764,-43  },
{17,807,-44  },
{18,851,-46  },
{19,897,-48  },
{20,945,-50  },
{21,995,-52  },
{22,1048,-54  },
{23,1102,-56  },
{24,1158,-58  },
{25,1217,-61  },
{26,1277,-63  },
{27,1340,-65  },
{28,1405,-67  },
{29,1472,-69  },
{30,1541,-71  },
{31,1612,-74  },
{32,1686,-76  },
{33,1762,-78  },
{34,1840,-80  },
{35,1920,-82  },
{36,2002,-84  },
{37,2086,-86  },
{38,2173,-88  },
{39,2261,-90  },
{40,2351,-92  },
{41,2443,-94  },
{42,2537,-96  },
{43,2633,-98  },
{44,2731,-99  },
{45,2830,-101 },
{46,2931,-102 },
{47,3033,-103 },
{48,3136,-105 },
{49,3241,-106 },
{50,3347,-107 },
{51,3454,-108 },
{52,3562,-109 },
{53,3671,-110 },
{54,3780,-110 },
{55,3890,-111 },
{56,4001,-111 },
{57,4112,-111 },
{58,4223,-111 },
{59,4335,-111 },
{60,4446,-111 },
{61,4557,-111 },
{62,4669,-111 },
{63,4780,-110 },
{64,4890,-110 },
{65,5000,-109 },
{66,5109,-109 },
{67,5218,-108 },
{68,5326,-107 },
{69,5433,-106 },
{70,5539,-105 },
{71,5644,-104 },
{72,5747,-103 },
{73,5850,-101 },
{74,5951,-100 },
{75,6051,-98  },
{76,6149,-97  },
{77,6246,-95  },
{78,6342,-94  },
{79,6436,-92  },
{80,6528,-91  },
{81,6619,-89  },
{82,6708,-87  },
{83,6795,-86  },
{84,6881,-84  },
{85,6965,-82  },
{86,7047,-81  },
{87,7128,-79  },
{88,7206,-77  },
{89,7283,-75  },
{90,7359,-74  },
{91,7432,-72  },
{92,7504,-70  },
{93,7574,-68  },
{94,7642,-67  },
{95,7709,-65  },
{96,7774,-63  },
{97,7838,-62  },
{98,7899,-60  },
{99,7959,-59  },
{100,8018,-57  },
{101,8075,-55  },
{102,8130,-54  },
{103,8184,-52  },
{104,8237,-51  },
{105,8288,-50  },
{106,8337,-48  },
{107,8385,-47  },
{108,8432,-45  },
{109,8478,-44  },
{110,8522,-43  },
{111,8565,-42  },
{112,8606,-40  },
{113,8647,-39  },
{114,8686,-38  },
{115,8724,-37  },
{116,8761,-36  },
{117,8797,-35  },
{118,8832,-34  },
{119,8865,-33  },
{120,8898,-32  },
{121,8930,-31  },
{122,8961,-30  },
{123,8990,-29  },
{124,9019,-28  },
{125,9047,-27  },
{126,9075,-26  },
{127,9101,-26  },
{128,9127,-25  },
{129,9152,-24  },
{130,9176,-23  },
{131,9199,-23  },
{132,9222,-22  },
{133,9243,-21  },
{134,9265,-21  },
{135,9285,-20  },
{136,9305,-19  },
{137,9325,-19  },
{138,9343,-18  },
{139,9362,-18  },
{140,9379,-18  },
};


static float adc_value_to_temp_situation(uint32_t big_measure_value , uint32_t small_measure_value ,uint16_t samle_value_temp,float target);
float search_data(float target)
{
    //target *100 ; 
    uint32_t target_val = (uint32_t)target;

    //int 
    int left = 0;
    int right = sizeof(gap_target_data) / sizeof(gap_target_data[0]) - 1;
    while (left < right)
    {
            
        int mid = (left + right) / 2;
        uint32_t res = gap_target_data[mid].adc_to_temp_data;
        //如果当前值等于目标值返回
        if (target_val == res)
        {
            return gap_target_data[mid].temp_data - DETLA_TEMPERATURE;
            //printf("get once succue\n");

        }
        //当前值小于目标值并且下一个值大于目标值
        else if (gap_target_data[mid].adc_to_temp_data < target_val && gap_target_data[mid + 1].adc_to_temp_data > target_val)
        {
            //printf("two temp,temp1 :%d,temp2:%d\n",gap_target_data[mid].temp_data ,gap_target_data[mid+1].temp_data );

            return adc_value_to_temp_situation(gap_target_data[mid + 1].adc_to_temp_data, gap_target_data[mid].adc_to_temp_data, gap_target_data[mid].temp_data, target_val);
        }
        //当前值大于目标值并且上一个值小于目标值
        else if (gap_target_data[mid].adc_to_temp_data > target_val && gap_target_data[mid - 1].adc_to_temp_data < target_val)
        {
            //printf("two temp_value , value1:%d,value2:%d\n",gap_target_data[mid-1].temp_data,gap_target_data[mid].temp_data);

            return adc_value_to_temp_situation(gap_target_data[mid].adc_to_temp_data, gap_target_data[mid - 1].adc_to_temp_data, gap_target_data[mid-1].temp_data, target_val);
        }
        else if (gap_target_data[mid].adc_to_temp_data > target_val)
        {
            right = mid;
        }
        else
        {
            left = mid + 1;
        }
    }
}

//number1 > number2 and number1 > target , number2 < target , val == number1.temp

//onec situation
static float adc_value_to_temp_situation(uint32_t big_measure_value, uint32_t small_measure_value, uint16_t samle_value_temp, float target)
{
    float ans = (samle_value_temp - DETLA_TEMPERATURE) + (((float)(target - small_measure_value)) / (float)((big_measure_value - small_measure_value)))  ;
    //printf("measure temp value :%f\n",ans ); 
    return ans;
}


#endif






