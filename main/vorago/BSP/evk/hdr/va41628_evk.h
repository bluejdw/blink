/***************************************************************************************
 * @file     va416xx_evk.h
 * @version  V1.13
 * @date     08 June 2022
 *
 * @note
 * VORAGO Technologies
 *
 * @note
 * Copyright (c) 2013-2022 VORAGO Technologies.
 *
 * @par
 * BY DOWNLOADING, INSTALLING OR USING THIS SOFTWARE, YOU AGREE TO BE BOUND BY
 * ALL THE TERMS AND CONDITIONS OF THE VORAGO TECHNOLOGIES END USER LICENSE AGREEMENT.
 * THIS SOFTWARE IS PROVIDED "AS IS". NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. VORAGO TECHNOLOGIES
 * SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
 * DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ****************************************************************************************/
 
#ifndef __BSP_EVK_H
#define __BSP_EVK_H

/*****************************************************************************/ 
/* Include files                                                             */ 
/*****************************************************************************/

/*****************************************************************************/ 
/* Global pre-processor symbols/macros ('#define')                           */ 
/*****************************************************************************/

/** Define external clocks on EVK (board specific) */
/** Can be overridden in project specific board.h */
#define EXTCLK          (40000000UL)      /* XTAL minus frequency */
#define XTAL            (10000000UL)      /* Oscillator frequency */

/** LED on MCU top board */
#define EVK_LED_PORT    PORTG
#define EVK_LED_BANK    VOR_GPIO->BANK[6]
#define EVK_LED_PIN     (5)

/** ADXL343BCCZ accelerometer I2C0 */
#define ACCEL_INCLUDE     "i2c_adxl343.h"
#define ACCEL_I2C         (VOR_I2C0)
#define ACCEL_I2C_BANK    (0)
#define ACCEL_I2C_ADDR    ((i2caddr_shifted_t)(0xA6))
//#define ACCEL_I2C_ADDR    ((i2caddr_shifted_t)(0x3A))

/** Accelerometer functions */
#define ACCEL_INIT           ADXL343_InitI2C
#define ACCEL_GET_RAW_VALUES ADXL343_GetAccelRawValues
#define ACCEL_GET_MG_VALUES  ADXL343_GetAccelMgValues
#define ACCEL_UNINIT         ADXL343_UnInit

/*****************************************************************************/ 
/* End of file                                                               */ 
/*****************************************************************************/
#endif /* __BSP_EVK_H */
