`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 15:42:26
// Design Name: 
// Module Name: tb_configurator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define define_width  32'h00000001 //设置输入图像宽度
`define define_height 32'h00000002 //设置输入图像高度
`define define_conv_coff 32'h00000003  //设置输入图像卷积核
`define define_conv_data 32'h00000004 //设置输入图像数据
`define define_decimal_num 32'h00000005 //设置输入定点数的小数位数
`define define_bram_mac_en 32'h00000006 //设置使能bram的mac功能
`define define_rd_result_en 32'h00000007 //设置使能读取结果

module tb_configurator(

    );

reg clk, rst_n;
reg [31:0] cfg_reg0, cfg_reg1;
wire [31:0] max_width, max_height, decimal_num;
wire cfg_coff_en, cfg_data_en;
wire bram_mac_en, rd_result_en; 

always #5 clk = ~clk;

initial begin
	clk = 1;
	rst_n = 0;
	#105
	rst_n = 1;
	
	cfg_reg0 = `define_width;
	cfg_reg1 = 'd512;
	#20
	
	cfg_reg0 = `define_height;
	cfg_reg1 = 'd512;
	#20
	
	cfg_reg0 = `define_decimal_num;
	cfg_reg1 = 'd16;
	#20
	
	cfg_reg0 = `define_conv_coff;
	cfg_reg1 = 1;
	#20	
	cfg_reg0 = `define_conv_coff;
	cfg_reg1 = 0;
	#20
	
	cfg_reg0 = `define_conv_data;
	cfg_reg1 = 1;
	#20	
	cfg_reg0 = `define_conv_data;
	cfg_reg1 = 0;
	#20
	
	cfg_reg0 = `define_bram_mac_en;
	cfg_reg1 = 1;
	#20
	
	cfg_reg0 = `define_rd_result_en;
	cfg_reg1 = 1;
	#20	
	cfg_reg0 = `define_rd_result_en;
	cfg_reg1 = 0;
	#20
	
	$finish;
end




configurator configurator_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.cfg_reg0(cfg_reg0),
	.cfg_reg1(cfg_reg1),
	.max_width(max_width),
	.max_height(max_height),
	.decimal_num(decimal_num),
	.cfg_coff_en(cfg_coff_en),
	.cfg_data_en(cfg_data_en),
	.bram_mac_en(bram_mac_en),
	.rd_result_en(rd_result_en)
);

endmodule
