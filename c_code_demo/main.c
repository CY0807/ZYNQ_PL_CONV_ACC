/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"
#include "dma_intr.h"
#include "sys_intr.h"
#include "xparameters.h"

static XScuGic Intc; //GIC
static  XAxiDma AxiDma;

u32 *TxBufferPtr= (u32 *)TX_BUFFER_BASE;
u32 *RxBufferPtr=(u32 *)RX_BUFFER_BASE;

extern volatile int TxDone;
extern volatile int RxDone;

const volatile int* pl_state = (XPAR_PL_REG0_S00_AXI_BASEADDR+8);

int init_intr_system(void);
int pl_acc_test();

u32 conv_coff[10] = {1,1,1,1,1,1,1,1,1,0};

int main()
{
    init_platform();
    print("UART OK!\n\r");
    init_intr_system();
    print("System Initiate OK!\n\r");

    while(1){
    //0:~, 1:+1, default:+0
    pl_acc_test();
    print("Test End!\n\r");
    sleep(1);
    }

    cleanup_platform();

    return 0;
}

int init_intr_system(void)
{
	DMA_Intr_Init(&AxiDma,0);// initial DMA interrupt system
	Init_Intr_System(&Intc); //initial interrupt system
	Setup_Intr_Exception(&Intc);
	DMA_Setup_Intr_System(&Intc,&AxiDma,TX_INTR_ID,RX_INTR_ID);//setup dma interrpt system
	DMA_Intr_Enable(&Intc,&AxiDma);
	return 0;
}

int pl_acc_test()
{
	// initiate
	int Status;
	TxDone = 0;
	RxDone = 0;
	int Index;
	int width = 10;
	int height = 10;
	int Len = width*height;

	xil_printf("\r\n----Test----\r\n");
	xil_printf("Len=%d\r\n",Len);

	// set TX data
	for(Index = 0; Index < Len; Index ++) {
		TxBufferPtr[Index] = Index+1;
	}
	xil_printf("TX data ready!\r\n");

	// 1.configure image width
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 1);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 10);

	// 2.configure image height
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 2);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 10);

	// 3.configure data decimal num
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 5);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 0);

	// 4.disable bram mac and read
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 6);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 0);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 7);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 0);

	// 5.configure conv coff
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 3);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 1);
		// conv coff TX data to DMA
	int Len_conv_coff = 10;
	Xil_DCacheFlushRange((u32)conv_coff, Len_conv_coff*4);
	Status = XAxiDma_SimpleTransfer(&AxiDma,(u32)conv_coff,
			Len_conv_coff*4, XAXIDMA_DMA_TO_DEVICE);
	if (Status != XST_SUCCESS) {
		xil_printf("conv coff to DMA Fail!\r\n");
		return XST_FAILURE;
	}
	while(TxDone == 0);
	xil_printf("conv coff to DMA OK!\r\n");
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 3);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 0);
	usleep(10);

	// 6.configure conv image data
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 4);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 1);
		// conv coff TX data to DMA
	Xil_DCacheFlushRange((u32)TxBufferPtr, Len*4);
	Status = XAxiDma_SimpleTransfer(&AxiDma,(u32)TxBufferPtr,
			Len*4, XAXIDMA_DMA_TO_DEVICE);
	if (Status != XST_SUCCESS) {
		xil_printf("conv image data to DMA Fail!\r\n");
		return XST_FAILURE;
	}
	while(TxDone == 0);
	xil_printf("conv image data to DMA OK!\r\n");

	// 7.wait for covolution complete
	while((*pl_state) & 0x00000002 == 0);
	xil_printf("conv OK!\r\n");
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 4);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 0);
	usleep(10);

	// 8.read convolution result
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 7);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 1);
		// DMA data to RX
	Status = XAxiDma_SimpleTransfer(&AxiDma,(u32)RxBufferPtr,
			Len*4, XAXIDMA_DEVICE_TO_DMA);
	if (Status != XST_SUCCESS) {
		xil_printf("DMA data to RX Fail!\r\n");
		return XST_FAILURE;
	}	
	while(RxDone == 0);
	#ifndef __aarch64__
		Xil_DCacheInvalidateRange((u32)RxBufferPtr, Len*4);
	#endif
	xil_printf("DMA data to RX OK!\r\n");

	// 9.wait util read result complete
	usleep(10);
	while((*pl_state)&0x00000004 == 0);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR, 7);
	Xil_Out32(XPAR_PL_REG0_S00_AXI_BASEADDR+4, 0);

	return 0;
}
