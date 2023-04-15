# ZYNQ_PL_CONV_ACC

摘要：一个基于ZYNQ，AXI接口的PL端卷积加速器，可由PS端调用

开发板型号：Zynq-7000 SoC XC7Z305 FPGA

开发平台：Vivado 2019.1； Vivado SDK 2019.1

## 1 文件描述：

（1）vivado_project存放了vivado和sdk原始工程文件

（2）c_project_demo存放了sdk工程中所用的核心代码

（3）image中存放了项目的一些截图与绘图，image目录下的仿真波形中存放着行为级仿真的截图，与工程中的仿真程序一一对应

## 2 硬件设计

1、总体框架：

<img src="https://user-images.githubusercontent.com/95362898/232226065-f230be56-e0f7-487e-9210-2ba80c5b5c88.png" height="600">

其中PL_reg模块基于AXI-Lite总线生成可供PS端寻址的两个配置寄存器和两个状态寄存器，并将这4个寄存器的接口与PL端卷积加速器（PL_conv_acc）连接，PS端可以通过这几个寄存器用来对PL端的卷积加速器进行配置和查询状态。

DMA为Vivado自带IP核，基于AXI-Stream，用于发送图像数据、卷积核参数到PL端卷积加速器，接受来自PL端加速器的卷积结果。同样这些步骤可以用过PS端配置DMA来进行控制。

2、Block Design图：

<img width="1266" alt="block design" src="https://user-images.githubusercontent.com/95362898/232227983-a459a157-4474-4e19-b7c3-374ca41f7217.png">

PL端加速器没有包含在Block Design中，在这个system中，将DMA的AXI-Stream接口和4个寄存器接口引出，并与在system_wrapper中例化的pl_conv_acc连接，从如下的文件组织结构图中可以看出：

<img width="447" alt="文件组织结构" src="https://user-images.githubusercontent.com/95362898/232228318-95c805ea-0e2c-4da4-a302-245cc0f02f11.png">

3、PL端加速器结构：

<img src="https://user-images.githubusercontent.com/95362898/232228564-08fd7801-f399-4cd4-a008-79343118469a.png" height="600">

PL端加速器通过两个异步FIFO与AXI-Stream接口进行跨时钟域数据交换，数据从输入到输出分别要进行padding 、conv_window、bram_mac三个模块，这三个模块的功能分别是：

padding：对图像进行padding 0填充；

conv_window：采用窗口生成器对图像数据进行卷积，该卷积支持有符号数的运算以及定点数运算；在工程中，数据都被设置成32位，读者可以根据需要修改；

bram_mac：例化了一段block ram用来暂时存放来自conv_window的数据，并支持新老数据相加后存入block ram的功能；

其中conv_window可以选择接受来自padding模块的图像数据，也可以从input fifo中直接获得卷积核参数的数据；

configuration模块接受由PS端赋值的两个配置寄存器，并根据寄存器内容配置加速器的相关参数和使能信号，相关verilog程序如下：

````
`define define_width  32'h00000001 //设置输入图像宽度
`define define_height 32'h00000002 //设置输入图像高度
`define define_conv_coff 32'h00000003  //设置输入图像卷积核
`define define_conv_data 32'h00000004 //设置输入图像数据
`define define_decimal_num 32'h00000005 //设置输入定点数的小数位数
`define define_bram_mac_en 32'h00000006 //设置使能bram的mac功能
`define define_rd_result_en 32'h00000007 //设置使能读取结果
````

````
case(cfg_reg0)
		`define_width: begin
			max_width <= cfg_reg1;
		end
		`define_height: begin
			max_height <= cfg_reg1;
		end
		`define_decimal_num: begin
			decimal_num <= cfg_reg1;
		end
		`define_conv_coff: begin
			cfg_coff_en <= ~(cfg_reg1 == 'd0);
		end
		`define_conv_data: begin
			cfg_data_en <= ~(cfg_reg1 == 'd0);
		end
		`define_bram_mac_en:begin
			bram_mac_en <= ~(cfg_reg1 == 'd0);
		end
		`define_rd_result_en:begin
			rd_result_en <= ~(cfg_reg1 == 'd0);
		end
		default: begin
			max_width <= 'd256;
			max_height <= 'd256;
			decimal_num <= 'd0;
			cfg_coff_en <= 0;
			cfg_data_en <= 0;	
			bram_mac_en <= 0;
			rd_result_en <= 0;
		end
endcase
````

## 3 软件设计

详见工程中的sdk目录，核心代码如下：

````
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
````
测试思路为：通过配置寄存器配置相关参数、传输卷积核参数数据、传输图像数据、等待卷积完成、发起读取结果请求、等待结果读取完成

在本示例中，输入的图像为10x10的数据，数值为1、2、3、···、100，padding为对1行、列进行补零，定点数小数位数为0，卷积核为3x3的全1矩阵，偏置为0。图像数据存储在TxBuffer中，地址为0x01100000，结果存储在RxBuffer中，地址为0x01300000，在SDK中进行测试，可见显示的两块区域的内存如下图：

<img width="1277" alt="SDK result" src="https://user-images.githubusercontent.com/95362898/232233035-bac203f9-f544-43e9-b111-ad846d236f1e.png">

对于图中的结果可以验证是正确的。

## 附 行为级仿真结果

### 1 padding模块

总体仿真时序

<img width="1259" alt="总体时序" src="https://user-images.githubusercontent.com/95362898/232233276-45bfe9dc-4895-47ed-8284-a34385b1dc16.png">

可见时序图中data_valid中间有一段是低电平，说明输入数据是不连续的，在这里是为了验证padding模块支持对不连续输入数据的正确操作，在输入不连续处的波形图放大如下：

<img width="1264" alt="输入数据不连续处的波形图" src="https://user-images.githubusercontent.com/95362898/232233339-6cdb16f4-c124-4491-963c-8a41e4023a63.png">

此外，在图像的行之间的波形图放大如下：

<img width="1260" alt="图像行之间的波形" src="https://user-images.githubusercontent.com/95362898/232233368-8ad2a356-1f2b-4f7f-a242-6ac47bcc6ea8.png">

### 2 configurator模块

<img width="581" alt="configurator" src="https://user-images.githubusercontent.com/95362898/232233404-487555fa-9591-46f5-ba46-b63dd657895e.png">

它根据两个配置寄存器：cfg_reg0和cfg_reg1的值配置其他相关变量

### 3 conv_window模块

总体时序图，其中图像高宽=32，图像数据为0，1，2，3······

<img width="1258" alt="总体波形图" src="https://user-images.githubusercontent.com/95362898/232233469-cf0a7a9c-2aa7-45b3-8fb0-8910f2967ae8.png">

配置卷积核系数处的波形图，其中w=1，偏置b=0，在cfg_conv_en为高电平时conv_window直接从input fifo中读取卷积核参数数据，反之从padding模块中读取图像数据

<img width="1258" alt="配置卷积核系数" src="https://user-images.githubusercontent.com/95362898/232233648-18e7d008-7197-4828-bf8d-f01680b9fb3a.png">

输出结果的开端处：

<img width="1256" alt="输出数据开端处" src="https://user-images.githubusercontent.com/95362898/232233668-acd8c43d-c61b-456f-975b-c13c682521d9.png">

输出结果的结尾处：

<img width="1258" alt="输出数据结尾处" src="https://user-images.githubusercontent.com/95362898/232233684-501f0a36-f681-4a91-bf23-a46c5a8207e7.png">

### 4 bram_mac模块

波形总体图：首先关闭模块的bram_mac功能，输入数据1、2、3、···、100，再读取一遍数据，得到1、2、3、···、100；然后打开bram_mac功能，再输入一次数据同样为1、2、3、···、100，第二次读取数据，得到2、4、6、···、200

<img width="1250" alt="波形总体图" src="https://user-images.githubusercontent.com/95362898/232233709-8e08cb3f-a975-4ae0-853a-fea841039767.png">

第一次读取数据波形图

<img width="1256" alt="第一次输出-关闭mac" src="https://user-images.githubusercontent.com/95362898/232233903-e067abc3-7997-4098-b768-246fd3951911.png">

第二次读取数据波形图

<img width="1247" alt="第二次输出-打开mac" src="https://user-images.githubusercontent.com/95362898/232233918-e57c30c4-63d0-486b-8d2e-646f03cbd110.png">

### 5 conv_acc模块（顶层模块）

波形总体图：输入的图像为10x10的数据，数值为1、2、3、···、100，padding为对1行、列进行补零，定点数小数位数为0，卷积核为3x3的全1矩阵，偏置为0

<img width="1268" alt="总体波形图" src="https://user-images.githubusercontent.com/95362898/232233950-15069a48-e788-48b3-ab8a-c44a6397c677.png">

输出结果的开端出的波形图

<img width="1250" alt="输出开端" src="https://user-images.githubusercontent.com/95362898/232233976-251f0fab-696f-4fad-b12d-a59edff4059a.png">

输出结果的结尾出的波形图

<img width="1256" alt="输出结尾" src="https://user-images.githubusercontent.com/95362898/232233984-a3267f08-70b6-45ff-8531-4d4d41ec162a.png">


