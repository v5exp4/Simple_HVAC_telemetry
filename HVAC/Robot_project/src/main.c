
/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx.h"
#include "stm32f4xx_conf.h"
#include "usbd_cdc_core.h"
#include "usbd_cdc_vcp.h"
#include "usbd_usr.h"
#include "usbd_desc.h"
#include "ventillator.h"
#include "tc77.h"


__ALIGN_BEGIN USB_OTG_CORE_HANDLE    USB_OTG_dev __ALIGN_END ;


extern double setpoint;
extern void init_PID(double Kp_param, double Ki_param, double Kd_param);
extern void PID_sampletime(void);
int main(void)
{

		ventillator_EN_init();
		ventillator_PWM_init();
		input_capture_setup();
		tc77_pin_config();
		init_PID(5, 0.1, 3);
		PID_sampletime();

		setpoint=25;
		GPIO_SetBits(GPIOC,GPIO_Pin_5);
		GPIO_SetBits(GPIOC,GPIO_Pin_4);

		set_ventillator_PWM (2,0);



  STM32F4_Discovery_LEDInit(LED3);
  STM32F4_Discovery_LEDInit(LED4);
  STM32F4_Discovery_LEDInit(LED5);
  STM32F4_Discovery_LEDInit(LED6);
  STM32F4_Discovery_PBInit(BUTTON_USER, BUTTON_MODE_EXTI);

  STM32F4_Discovery_LEDOn(LED4);
  STM32F4_Discovery_LEDOn(LED3);

  USBD_Init(&USB_OTG_dev,
#ifdef USE_USB_OTG_HS 
  USB_OTG_HS_CORE_ID,
#else            
  USB_OTG_FS_CORE_ID,
#endif  
  &USR_desc, 
  &USBD_CDC_cb,
  &USR_cb);


    while (1){

    };

  }



