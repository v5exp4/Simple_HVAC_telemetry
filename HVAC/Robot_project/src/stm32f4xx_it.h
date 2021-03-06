/**
*****************************************************************************
**
**  File        : stm32f4xx_it.h
**
**  Abstract    : Main Interrupt Service Routines.
**                This file provides template for all exceptions handler and
**                peripherals interrupt service routine.
**
**  Environment : Atollic TrueSTUDIO(R)
**                STMicroelectronics STM32F4xx Standard Peripherals Library
**
**  Distribution: The file is distributed �as is,� without any warranty
**                of any kind.
**
**  (c)Copyright Atollic AB.
**  You may use this file as-is or modify it according to the needs of your
**  project. Distribution of this file (unmodified or modified) is not
**  permitted. Atollic AB permit registered Atollic TrueSTUDIO(R) users the
**  rights to distribute the assembled, compiled & linked contents of this
**  file as part of an application binary file, provided that it is built
**  using the Atollic TrueSTUDIO(R) toolchain.
**
**
*****************************************************************************
*/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM32F4xx_IT_H
#define __STM32F4xx_IT_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "stm32f4xx.h"

extern uint8_t set_value[5];
extern uint32_t measured_value11, measured_value12;
extern uint32_t measured_value31, measured_value32;
extern uint32_t CaptureNumber1;
extern uint32_t CaptureNumber3;
extern uint32_t Capture1;
extern uint32_t Capture3;
extern uint32_t Fan_1_frequency;
extern uint32_t TIM5Freq3;
extern uint32_t TIM5Freq1_previous;
extern uint32_t TIM5Freq3_previous;
extern uint8_t enable;

void NMI_Handler(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
void UsageFault_Handler(void);
void SVC_Handler(void);
void DebugMon_Handler(void);
void PendSV_Handler(void);
void SysTick_Handler(void);

void TIM5_IRQHandler(void);
void TIM5_CC_IRQHandler(void);
void TIM2_IRQHandler(void);
void TIM7_IRQHandler(void);
void USART1_IRQHandler(void);


extern uint8_t WORK;

// Headers
#define START 0xff
#define ID_temp1 1
#define ID_temp2 2
#define ID_temp3 3
#define ID_temp4 4
#define ID_freq1 5
#define ID_freq3 6
#define ID_fan_1_PWM 7
#define ID_fan_3_PWM 8
#define ID_pid_p 9
#define ID_pid_i 10
#define ID_pid_d 11
#define ID_req_temp1 12
#define ID_req_temp2 13
#define ID_req_temp3 14
#define ID_req_temp4 15
#define ID_start 16
#define ID_stop 17
#define ID_self_check 18
#define ID_halted 21

//Message length
#define temperature_message_length 8
#define fan_frequency_message_length 7
#define fan_PWM_message_length 7
#define halted_message_length 7

#ifdef __cplusplus
}
#endif

#endif /* __STM32F4xx_IT_H */
