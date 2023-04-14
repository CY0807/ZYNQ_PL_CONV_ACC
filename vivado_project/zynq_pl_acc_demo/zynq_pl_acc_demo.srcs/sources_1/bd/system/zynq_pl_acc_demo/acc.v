`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/20 22:13:35
// Design Name: 
// Module Name: acc
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


module acc(
    input clk,
    input rst_n,
    
    input [31:0] reg0,
    
    input [31:0] fifo_wr_data,
    input fifo_wren,
    output [31:0] fifo_rd_data,
    input fifo_rden,
    output empty,
    output [8:0] data_count
    
    );
 
wire empty, full;
wire [8:0] data_count; 
reg [31:0] din;
reg wr_en;

 
always@(posedge clk or negedge rst_n)
    if(!rst_n) begin
        din <= 0;
        wr_en <= 0;
    end
    else begin
        wr_en <= fifo_wren;
        if(reg0 == 0)
            din <= ~fifo_wr_data;
        else if(reg0 == 1)
            din <= fifo_wr_data + 1;
        else
            din <= fifo_wr_data;        
    end
                   
fifo_generator_0 your_instance_name (
  .clk(clk),                // input wire clk
  .srst(~rst_n),              // input wire srst
  .din(din),                // input wire [31 : 0] din
  .wr_en(wr_en),            // input wire wr_en
  .rd_en(fifo_rden),            // input wire rd_en
  .dout(fifo_rd_data),              // output wire [31 : 0] dout
  .full(full),              // output wire full
  .empty(empty),            // output wire empty
  .data_count(data_count)  // output wire [8 : 0] data_count
);    
    
    
    
    
endmodule
