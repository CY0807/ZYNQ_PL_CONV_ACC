`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/11 09:47:07
// Design Name: 
// Module Name: padding
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


module padding
(
	input clk,
	input rst_n,
	input start,
	output data_req,
	input [31:0] data_in,
	input data_in_valid,
	input [31:0] max_width,
	input [31:0] max_height,
	output [31:0] data_out,
	output data_out_valid
);

// enable信号：start后拉高，padding一次图像、rst后拉低
reg enable;

always@(posedge clk or negedge rst_n)
if(~rst_n)
	enable <= 0;
else if((row==max_height+1) & (col==max_width+1))
	enable <= 0;
else if(start)
	enable <= 1;
else 
	enable <= enable;
	
// data_valid信号：考虑原图像和padding处图像的有效性
wire data_valid1 = (col==0)|(row==0)|(col==max_width+1)|(row==max_height+1);
wire data_valid2 = data_in_valid & data_req;
wire data_valid = (data_valid1 | data_valid2) & enable;

// counter：此处由于padding，图像长宽+2
reg [9:0] row, col;

always@(posedge clk or negedge rst_n)
if(~rst_n) begin
	row <= 0;
	col <= 0;
end
else if(data_valid & enable) begin
	col <= col + 1;
	if(col == max_width+1) begin
		col <= 0;
		row <= row +1;
		if(row == max_height+1) begin
			row <= 0;
		end
	end
end

// output信号
assign data_req = (col>=1)&(row>=1)&(col<=max_width)&(row<=max_height);
assign data_out_valid = data_valid; //输入和输出数据是同步的
assign data_out = data_req ? data_in : 0;


endmodule
