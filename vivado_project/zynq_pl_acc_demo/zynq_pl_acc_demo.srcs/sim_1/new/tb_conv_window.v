`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 23:12:48
// Design Name: 
// Module Name: tb_conv_window
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


module tb_conv_window(

    );

// clk and rst	
reg clk_acc, system_ready, rst_n_AXI;
always #5 clk_acc = ~clk_acc;

initial begin
	clk_acc = 1;
	max_width = 32;
	max_height = 32;
	decimal_num = 0;
	rst_n_AXI = 1;
end

// data,command signals to generate,receive
reg signed [31:0] dout_infifo_original, dout_infifo;
reg valid_infifo;

integer k;

always@(posedge clk_acc)
if(data_req_padding & data_in_valid_padding)
	dout_infifo_original <= dout_infifo_original + 1;
	
always@(*)
	dout_infifo = dout_infifo_original <<< (decimal_num);
	
initial begin
	system_ready = 0;
	cfg_coff_en = 0;
	cfg_data_en = 0;
	valid_infifo = 0;
	dout_infifo_original = 0;
	
	#105
	system_ready = 1;
	cfg_coff_en = 1;
	
	#100 
	valid_infifo = 1;
	dout_infifo_original = 1;
	#90
	dout_infifo_original = -5;
	#10
	valid_infifo = 0;
	cfg_coff_en = 0;
	dout_infifo_original = -5;
	
	#100
	cfg_data_en = 1;
	#100
	valid_infifo = 1;
	
end

// other signals

reg [31:0] max_width, max_height, decimal_num;
reg cfg_coff_en, cfg_data_en; // Coefficients to be Configured

reg [9:0] cfg_coff_en_r, cfg_data_en_r; //打拍供其他模块使用
reg cfg_coff_en_rise, cfg_data_en_rise;
always@(posedge clk_acc) begin
	cfg_coff_en_r <= {cfg_coff_en_r[8:0], cfg_coff_en};
	cfg_data_en_r <= {cfg_data_en_r[8:0], cfg_data_en};
	cfg_coff_en_rise <= cfg_coff_en & (~cfg_coff_en_r[1]);
	cfg_data_en_rise <= cfg_data_en & (~cfg_data_en_r[1]);
end
	
// Padding SubModule

wire clk_padding = clk_acc;
wire rst_n_Index_padding = ~cfg_data_en_rise;
wire rst_n_padding = rst_n_AXI & system_ready & rst_n_Index_padding; //复位padding的index
wire start_padding = cfg_data_en_r[8]&(~cfg_data_en_r[9]);
wire data_req_padding;
wire [31:0] data_in_padding = dout_infifo;
wire data_in_valid_padding = valid_infifo & cfg_data_en; //只接受图像数据，不接受卷积核系数
wire [31:0] data_out_padding;
wire data_out_valid_padding;

padding padding_inst
(
	.clk(clk_padding),
	.rst_n(rst_n_padding),
	.start(start_padding),
	.data_req(data_req_padding),
	.data_in(data_in_padding),
	.data_in_valid(data_in_valid_padding),
	.max_width(max_width),
	.max_height(max_height),
	.data_out(data_out_padding),
	.data_out_valid(data_out_valid_padding)
);

// Convolution Window SubModule

wire clk_cw = clk_acc;
wire rst_n_Index_cw = ~cfg_data_en_rise;
wire rst_n_cw = rst_n_AXI & system_ready & rst_n_Index_cw;
wire [31:0] data_in_cw = cfg_coff_en ? dout_infifo : data_out_padding;
wire data_in_valid_cw = cfg_coff_en ? valid_infifo : data_out_valid_padding;
wire [31:0] data_out_cw;
wire data_out_valid_cw, complete_cw;

conv_window conv_window_inst
(
	.clk(clk_cw),
	.rst_n(rst_n_cw),
	.data_in(data_in_cw),
	.data_in_valid(data_in_valid_cw),
	.max_width(max_width),
	.max_height(max_height),
	.decimal_num(decimal_num),
	.data_out(data_out_cw),
	.data_out_valid(data_out_valid_cw),
	.cfg_coff_en(cfg_coff_en),
	.complete(complete_cw)
	
);
	
	
	
endmodule
