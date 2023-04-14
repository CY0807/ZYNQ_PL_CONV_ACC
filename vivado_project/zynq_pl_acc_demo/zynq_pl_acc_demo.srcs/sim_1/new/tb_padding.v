`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 10:12:37
// Design Name: 
// Module Name: tb
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


module tb_padding(

    );
	
reg clk, rst_n, start, data_in_valid;
reg [31:0] data_in;
wire data_req, data_out_valid;
wire [31:0] data_out;
	
always #5 clk = ~clk;

always@(posedge clk)
if(data_req & data_in_valid)
	data_in <= data_in + 1;

initial begin
	clk = 1;
	rst_n = 0;
	start = 0;
	data_in = 1;
	data_in_valid = 0;
	
	// start
	#105
	rst_n = 1;
	data_in_valid = 1;
	#100
	start = 1;
	#20
	start = 0;
	
	// infifo数据empty测试
	#2000
	data_in_valid = 0;
	#200
	data_in_valid = 1;
end	

	
padding padding_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.start(start),
	.data_req(data_req),
	.data_in(data_in),
	.data_in_valid(data_in_valid),
	.max_width('d32),
	.max_height('d32),
	.data_out(data_out),
	.data_out_valid(data_out_valid)
);	
	
endmodule
