`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/12 17:13:29
// Design Name: 
// Module Name: bram_mac
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


module bram_mac
(
	input  wire clk,
	input  wire rst_n,
	input  wire rst_index,
	input  wire ena,
	input  wire [31:0] data_in,
	input  wire data_in_valid,
	output reg  complete, //到bram的index末尾拉高,rst后拉低
	input  wire rden,
	output wire [31:0] data_out,
	output wire data_out_valid,
	input  wire bram_mac_en
);

// basic variables	
reg [17:0] addra, addrb;
wire wea;
wire [31:0] doutb, dina;

// addr_max and complete signal
reg [17:0] addr_max;

always@(posedge clk) begin
if((~rst_n)|complete)
	addr_max <= 0;
else if(addra > addr_max)
	addr_max <= addra;
end

always@(posedge clk) begin
	if((~rst_n)|rst_index) begin
		complete <= 0;
	end
	else if(rden) begin
		if(addrb == addr_max-1) begin
			complete <= 1;
		end
	end
end


// write bram: port a
reg [1:0] wea_pre;
reg [31:0] data_in_r, data_sum;

always@(posedge clk) begin
	if((~rst_n)|rst_index) begin
		addra <= 0;
		wea_pre[0] <= 0;
		wea_pre[1] <= 0;
		data_in_r <= 0;
		data_sum <= 0;
	end
	else begin
		data_in_r <= data_in;
		wea_pre <= {wea_pre[0], data_in_valid};
		
		if(bram_mac_en)
			data_sum <= data_in_r + doutb;
		else 
			data_sum <= data_in_r;
		
		if(wea)
			addra <= addra + 1;
	end

end

assign dina = data_sum;
assign wea = wea_pre[1];



// read bram: port b
reg rden_r;

always@(posedge clk) begin
	if(~rst_n)
		rden_r <= 0;
	rden_r <= rden;
	
	if((~rst_n)|rst_index) begin
		addrb <= 0;
	end
	else if((rden&(~complete)) | data_in_valid) begin
		addrb <= addrb + 1;
	end
end

assign data_out_valid = rden_r & (addrb<=addr_max);
assign data_out = doutb;


blk_mem blk_mem_inst (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [17 : 0] addra
  .dina(dina),    // input wire [31 : 0] dina
  
  .clkb(clk),    // input wire clkb
  .enb(ena),      // input wire enb
  .addrb(addrb),  // input wire [17 : 0] addrb
  .doutb(doutb)   // output wire [31 : 0] doutb
);

// ila: clk, rden, addrb[7:0], addr_max[7:0]

ila_bram_mac your_instance_name (
	.clk(clk), // input wire clk


	.probe0(rden), // input wire [0:0]  probe0  
	.probe1(addrb[7:0]), // input wire [7:0]  probe1 
	.probe2(addr_max[7:0]), // input wire [7:0]  probe2
	.probe3(data_in_valid), 
	.probe4(complete)
);

endmodule
