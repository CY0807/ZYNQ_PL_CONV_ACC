`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/08 17:06:33
// Design Name: 
// Module Name: conv_window
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

module conv_window(
	input clk,
	input rst_n,
	input [31:0] data_in,
	input data_in_valid,
	input [31:0] max_width,
	input [31:0] max_height,
	input [31:0] decimal_num,
	output [31:0] data_out,
	output data_out_valid,
	input cfg_coff_en,
	output complete
);

// Configure the Convolution Coeffients

wire conv_coff_valid = data_in_valid & cfg_coff_en;
reg [3:0] conv_coff_index;
reg signed [31:0] conv_coff[0:9]; //w权重9个参数，b偏置1个参数

always@(posedge clk or negedge rst_n) begin
if(~rst_n) begin
	conv_coff_index <= 0;
end	
else if(conv_coff_valid) begin
	conv_coff[conv_coff_index] <= data_in;
	conv_coff_index <= conv_coff_index + 1;
	if(conv_coff_index == 9)
		conv_coff_index <= 0;
end
end

// Fifos for Window Generator: First Word Fall Through

wire img_data_valid = data_in_valid & (~cfg_coff_en);
wire wr_en_fifo1 = img_data_valid;
wire wr_en_fifo2 = valid_fifo1&rd_en_fifo1;

wire rd_en_fifo1 = (cnt_fifo1==max_width+2);
wire rd_en_fifo2 = (cnt_fifo2==max_width+2);

wire [9:0] cnt_fifo1, cnt_fifo2;
wire [31:0] dout_fifo1, dout_fifo2;
wire valid_fifo1, valid_fifo2;

fifo_conv_window fifo1 (
  .clk			(clk),               
  .srst			(~rst_n),           
  .din			(data_in),         
  .wr_en		(wr_en_fifo1),     
  .rd_en		(rd_en_fifo1),     
  .dout			(dout_fifo1),       
  .valid		(valid_fifo1),     
  .data_count	(cnt_fifo1)   
);

fifo_conv_window fifo2 (
  .clk			(clk),               
  .srst			(~rst_n),           
  .din			(dout_fifo1),         
  .wr_en		(wr_en_fifo2),     
  .rd_en		(rd_en_fifo2),     
  .dout			(dout_fifo2),       
  .valid		(valid_fifo2),     
  .data_count	(cnt_fifo2)   
);

// Multiply and Add Tree
integer j;
reg signed [31:0] conv_data[0:8];
reg signed [63:0] product[0:8];
reg signed [31:0] sum1[0:4], sum2[0:2], sum3[0:1], sum4;
assign data_out  = sum4;

always@(posedge clk) begin
	if(img_data_valid) begin
		conv_data[8] <= data_in;
		conv_data[7] <= conv_data[8];
		conv_data[6] <= conv_data[7];
	end
	if(valid_fifo1) begin
		conv_data[5] <= dout_fifo1;
		conv_data[4] <= conv_data[5];
		conv_data[3] <= conv_data[4];
	end
	if(valid_fifo2) begin
		conv_data[2] <= dout_fifo2;
		conv_data[1] <= conv_data[2];
		conv_data[0] <= conv_data[1];
end
end

integer k;

always@(posedge clk) begin
	for(j=0; j<=8; j=j+1) begin
		product[j] <= conv_data[j]*conv_coff[j];
	end
	
	for(k=0; k<=3; k=k+1) begin
		sum1[k] <= (product[2*k]+product[2*k+1])>>>(decimal_num);
	end
	sum1[4] <= (product[8]>>>decimal_num) + conv_coff[9];
	
	sum2[0] = sum1[0] + sum1[1];
	sum2[1] = sum1[2] + sum1[3];
	sum2[2] = sum1[4];
	
	sum3[0] = sum2[0]+sum2[1];
	sum3[1] = sum2[2];
	
	sum4 = sum3[0] + sum3[1];
	
end


// Output Valid Signal
wire data_out_valid_pre = img_data_valid&(row>=2)&(col>=2);
reg [3:0] data_out_valid_pre_r;
assign data_out_valid = data_out_valid_pre_r[3];

always@(posedge clk or negedge rst_n)
if(~rst_n) 
	data_out_valid_pre_r <= 0;
else
	data_out_valid_pre_r <= {data_out_valid_pre_r[2:0],data_out_valid_pre};


// Counter：此处由于padding，图像长宽+2
reg [9:0] row, col;

always@(posedge clk or negedge rst_n)
if(~rst_n) begin
	row <= 0;
	col <= 0;
end
else if(img_data_valid) begin
	col <= col + 1;
	if(col == max_width+1) begin
		col <= 0;
		row <= row +1;
		if(row == max_height+1) begin
			row <= 0;
		end
	end
end

// Complete
wire complete_pre = (row == max_height+1) & (col == max_width+1);
reg [7:0] complete_pre_r;

always@(posedge clk or negedge rst_n)
if(~rst_n)
	complete_pre_r <= 0;
else
	complete_pre_r <= {complete_pre_r[6:0], complete_pre};

assign complete = complete_pre_r[7] | complete_pre_r[6];


endmodule
