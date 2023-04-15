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





