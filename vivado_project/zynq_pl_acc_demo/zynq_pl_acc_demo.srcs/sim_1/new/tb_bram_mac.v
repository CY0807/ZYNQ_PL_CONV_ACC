`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/12 20:24:18
// Design Name: 
// Module Name: tb_bram_mac
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


module tb_bram_mac(

    );
	
wire clk = clk_acc;	
reg clk_acc, system_ready, data_out_valid_cw; 
reg [31:0] data_out_cw;	
reg cfg_data_en, bram_mac_en, rd_result_en; // Coefficients to be Configured

always #5 clk_acc = ~clk_acc;
always@(posedge clk_acc) begin
	if(data_out_valid_cw) begin
		data_out_cw <= data_out_cw + 1;
	end
end

initial begin
	clk_acc = 1;
	system_ready = 0;
	data_out_cw = 0;
	cfg_data_en = 0;
	bram_mac_en = 0;
	rd_result_en = 0;
	data_out_cw = 1;
	data_out_valid_cw = 0;
	# 105
	system_ready = 1;
	
	cfg_data_en = 1;
	bram_mac_en = 0;
	data_out_cw = 1;
	# 100
	data_out_valid_cw = 1;
	# 1000
	data_out_valid_cw = 0;
	# 100
	cfg_data_en = 0;
	# 100
	rd_result_en = 1;
	# 1100
	rd_result_en = 0;
	# 100
	
	cfg_data_en = 1;
	bram_mac_en = 1;
	data_out_cw = 1;
	# 100
	data_out_valid_cw = 1;
	# 1000
	data_out_valid_cw = 0;
	# 100
	cfg_data_en = 0;
	# 100
	rd_result_en = 1;
	# 1100
	rd_result_en = 0;
	# 100
	$finish;
end


	
// Configuration and Status Register


reg [9:0] cfg_data_en_r, rd_result_en_r; //打拍供其他模块使用
reg cfg_data_en_rise, rd_result_en_rise;
always@(posedge clk) begin
	cfg_data_en_r <= {cfg_data_en_r[8:0], cfg_data_en};
	rd_result_en_r <= {rd_result_en_r[8:0], rd_result_en};
	cfg_data_en_rise <= cfg_data_en & (~cfg_data_en_r[1]);
	rd_result_en_rise <= rd_result_en & (~rd_result_en_r[1]);
end
	
	
// Block RAM and MAC

wire clk_bm = clk_acc;
wire rst_n_bm = system_ready;
wire rst_index_bm = cfg_data_en_rise | rd_result_en_rise; //开始读/取数据时复位index
wire ena_bm = system_ready;
wire [31:0] data_in_bm = data_out_cw;
wire data_in_valid_bm = data_out_valid_cw;
wire complete, data_out_valid_bm;
wire [31:0] data_out_bm;
wire almost_full_outfifo = 0;
assign rden_bm = rd_result_en_r[9] & (~almost_full_outfifo);
	//rd_result_en_rise若干周期后，开始读取bram

bram_mac bram_mac_inst
(
	.clk(clk_bm),
	.rst_n(rst_n_bm),
	.rst_index(rst_index_bm),
	.ena(ena_bm),
	.data_in(data_in_bm),
	.data_in_valid(data_in_valid_bm),
	.complete(complete), //到bram的index末尾拉高，在rst_index后拉低
	.rden(rden_bm),
	.data_out(data_out_bm),
	.data_out_valid(data_out_valid_bm),
	.bram_mac_en(bram_mac_en)
);


	
endmodule
