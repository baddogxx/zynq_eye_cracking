#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "xil_types.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "xaxivdma.h"
#include "xaxivdma_i.h"
#include "display_ctrl_hdmi/display_ctrl.h"
#include "vdma_api/vdma_api.h"
#include "emio_sccb_cfg/emio_sccb_cfg.h"
#include "ov5640/ov5640_init.h"

#include "xgpiops.h"
#include "sleep.h"
#include "xil_printf.h"


#define DYNCLK_BASEADDR  XPAR_AXI_DYNCLK_0_BASEADDR  //��̬ʱ�ӻ���ַ
#define VDMA_ID          XPAR_AXIVDMA_0_DEVICE_ID    //VDMA����ID
#define DISP_VTC_ID      XPAR_VTC_0_DEVICE_ID        //VTC����ID


//frame buffer����ʼ��ַ
unsigned int const frame_buffer_addr = (XPAR_PS7_DDR_0_S_AXI_BASEADDR
										+ 0x1000000);
XAxiVdma     vdma;
DisplayCtrl  dispCtrl;
VideoMode    vd_mode;

#define LED_DEVICE_ID XPAR_XGPIOPS_0_DEVICE_ID
XGpioPs Gpio;


int main(void)
{

		xil_printf("Im'fine\r\n");
		u32 status;
		u16 cmos_h_pixel;                    //ov5640 DVP ���ˮƽ���ص���
		u16 cmos_v_pixel;                    //ov5640 DVP �����ֱ���ص���
		u16 total_h_pixel;                   //ov5640 ˮƽ�����ش�С
		u16 total_v_pixel;                   //ov5640 ��ֱ�����ش�С

		cmos_h_pixel = 1280;                 //����OV5640����ֱ���Ϊ640*480
		cmos_v_pixel = 720;
		total_h_pixel = 2570;
		total_v_pixel = 980;

		emio_init();                         //��ʼ��EMIO
		status = ov5640_init( cmos_h_pixel,  //��ʼ��ov5640
							  cmos_v_pixel,
							 total_h_pixel,
							 total_v_pixel);
		if(status == 0)
//			xil_printf("OV5640 detected successful!\r\n");
//		else
//			xil_printf("OV5640 detected failed!\r\n");

		vd_mode = VMODE_1280x720;

		//����VDMA
		run_vdma_frame_buffer(&vdma, VDMA_ID, vd_mode.width, vd_mode.height,
								frame_buffer_addr,0,0,BOTH);
	    //��ʼ��Display controller
		DisplayInitialize(&dispCtrl, DISP_VTC_ID, DYNCLK_BASEADDR);
	    //����VideoMode
		DisplaySetMode(&dispCtrl, &vd_mode);
		DisplayStart(&dispCtrl);














	//debug��
//	xil_printf("Im'ok\r\n");
//	int Status;
//		XGpioPs_Config *ConfigPtr;
//
//		/* Initialize the GPIO driver. */
//		ConfigPtr = XGpioPs_LookupConfig(LED_DEVICE_ID);
//		Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr,
//							ConfigPtr->BaseAddr);
//			if (Status != XST_SUCCESS) {
//				return XST_FAILURE;
//			}
//		XGpioPs_SetDirectionPin(&Gpio, 56, 1);		//	���������������Ϊ output
//		XGpioPs_SetOutputEnablePin(&Gpio, 56, 1);	//	���ʹ��
//		while(1){
//				xil_printf("PWM_IP Test!\n");
//				XGpioPs_WritePin(&Gpio, 56, 0x1);			//	����led
//				sleep(1);
//				XGpioPs_WritePin(&Gpio, 56, 0x0);			//	����led
//				sleep(1);
//			}
//
//






    return 0;
}
