#include "AccMgr.h"
#include <nrf_delay.h>
#include <nrf_drv_twi.h>
#include <stdio.h>
#include "boards.h"
#include "nrf_log.h"
#include "nrf_drv_twi.h"
#include "ads1115.h"

/* TWI instance ID. */
#if TWI0_ENABLED
#define TWI_INSTANCE_ID     0
#elif TWI1_ENABLED
#define TWI_INSTANCE_ID     1
#endif


static const nrf_drv_twi_t m_twi = NRF_DRV_TWI_INSTANCE(TWI_INSTANCE_ID);

void Acc_mgr_init(void)
{
  ret_code_t err_code;

    const nrf_drv_twi_config_t twi_config = {
       .scl                = ARDUINO_SCL_PIN,
       .sda                = ARDUINO_SDA_PIN,
       .frequency          = NRF_DRV_TWI_FREQ_100K,
       .interrupt_priority = APP_IRQ_PRIORITY_HIGH,
       .clear_bus_init     = false
    };

    err_code = nrf_drv_twi_init(&m_twi, &twi_config, NULL, NULL);
    APP_ERROR_CHECK(err_code);

    nrf_drv_twi_enable(&m_twi);
}

uint8_t Acc_ReadReg(uint8_t addr , uint16_t *buf)
{
  ret_code_t err_code = 0;
  uint8_t readAddr[] = {addr};

  err_code = nrf_drv_twi_tx(&m_twi, ADS1115_ADDRESS, readAddr, 1, true);
  APP_ERROR_CHECK(err_code);
  
  uint8_t storge_buf_data[2];
  err_code = nrf_drv_twi_rx(&m_twi, ADS1115_ADDRESS, storge_buf_data, 2);

  *buf = storge_buf_data[0]<<8;
  *buf += storge_buf_data[1];

  APP_ERROR_CHECK(err_code);

  return true;
}

uint8_t Acc_WriteReg(uint8_t addr, uint16_t buf)
{
  uint8_t txBuf[3];
  txBuf[0] = addr ;
  txBuf[1] = (uint8_t)(buf>>8);
  txBuf[2] = (uint8_t)(buf & 0xFF);

  ret_code_t err_code = nrf_drv_twi_tx(&m_twi, ADS1115_ADDRESS, txBuf, sizeof(txBuf), true);
  APP_ERROR_CHECK(err_code);

  return true;
}
