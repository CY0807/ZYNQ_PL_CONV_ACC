`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/09 10:17:20
// Design Name: 
// Module Name: Conv_Acc
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


module Conv_Acc
(
	input clk_ps,

    input wire [31:0]M_AXIS_MM2S_0_tdata,
    input wire [3:0]M_AXIS_MM2S_0_tkeep,
    input wire M_AXIS_MM2S_0_tlast,
    output wire M_AXIS_MM2S_0_tready,
    input wire M_AXIS_MM2S_0_tvalid,
    
    output wire [31:0]S_AXIS_S2MM_0_tdata,
    output wire [3:0]S_AXIS_S2MM_0_tkeep,
    output wire S_AXIS_S2MM_0_tlast,
    input wire S_AXIS_S2MM_0_tready,
    output wire S_AXIS_S2MM_0_tvalid,
    
    input wire mm2s_prmry_reset_out_n_0,    
    input wire s2mm_prmry_reset_out_n_0,
    
    input  wire [31:0] reg0,
	input  wire [31:0] reg1,
	output wire [31:0] reg2,
	output wire [31:0] reg3
);

//******** wire and reg declaration ********

// Basic 
wire rst_n_AXI;
wire system_ready;

// Clocking Wizard
wire pll_ready;
wire clk_acc;

// Input FIFO: First Word Fall Through
wire rst_infifo;
wire wr_clk_infifo;
wire rd_clk_infifo;
wire [31:0] din_infifo;
wire wren_infifo;
wire rden_infifo;
wire [31:0] dout_infifo;
wire full_infifo, empty_infifo, valid_infifo, almost_empty_infifo; 
wire almost_full_infifo, wr_rst_busy_infifo, rd_rst_busy_infifo;

// Configuration and Status Register
wire [31:0] cfg_reg0;
wire [31:0] cfg_reg1;
reg  [31:0] stat_reg0;
reg  [31:0] stat_reg1;
wire [31:0] max_width, max_height, decimal_num;
wire cfg_coff_en, cfg_data_en;
wire bram_mac_en, rd_result_en; // Coefficients to be Configured
reg [9:0] cfg_coff_en_r, cfg_data_en_r, rd_result_en_r; //打拍供其他模块使用
reg cfg_coff_en_rise, cfg_data_en_rise, rd_result_en_rise;

// Padding SubModule
wire clk_padding;;
wire rst_n_Index_padding;
wire rst_n_padding; //复位padding的index
wire start_padding;
wire data_req_padding;
wire [31:0] data_in_padding;
wire data_in_valid_padding; //只接受图像数据，不接受卷积核系数
wire [31:0] data_out_padding;
wire data_out_valid_padding;

// Convolution Window SubModule
wire clk_cw;
wire rst_n_Index_cw;
wire rst_n_cw;
wire [31:0] data_in_cw;
wire data_in_valid_cw;
wire [31:0] data_out_cw;
wire data_out_valid_cw, complete_cw;

// Block RAM and MAC
wire clk_bm;
wire rst_n_bm;
wire rst_index_bm; //开始读/取数据时复位index
wire ena_bm;
wire [31:0] data_in_bm;
wire data_in_valid_bm;
wire complete_bm_rd, data_out_valid_bm;
wire [31:0] data_out_bm;

// Output FIFO: First Word Fall Through
wire rst_outfifo;
wire wr_clk_outfifo;
wire rd_clk_outfifo;
wire [31:0] din_outfifo;
wire wren_outfifo;
wire [31:0] dout_outfifo;
wire rden_outfifo;
wire full_outfifo, empty_outfifo, valid_outfifo, almost_empty_outfifo;
wire almost_full_outfifo, wr_rst_busy_outfifo, rd_rst_busy_outfifo;

// AXI Bus Configuration
wire rd_result_last; //传递从bram_mac处的complete信号为AXI的last信号
wire valid_sf;

// Status Register: None


//******** Main Code ********

// Basic 

assign rst_n_AXI = mm2s_prmry_reset_out_n_0 & s2mm_prmry_reset_out_n_0;
assign system_ready = pll_ready&(~wr_rst_busy_infifo)&(~rd_rst_busy_infifo)&(~wr_rst_busy_outfifo)&(~rd_rst_busy_outfifo);

// Clocking Wizard

pll instance_name
(
    .clk_acc(clk_acc),     	
    .reset(1'b0), 			
    .locked(pll_ready),      
    .clk_in1(clk_ps)
);     

// Input FIFO: First Word Fall Through

assign rst_infifo = ~rst_n_AXI;
assign wr_clk_infifo = clk_ps;
assign rd_clk_infifo = clk_acc;
assign din_infifo = M_AXIS_MM2S_0_tdata;
assign wren_infifo = M_AXIS_MM2S_0_tready & M_AXIS_MM2S_0_tvalid;
assign rden_infifo = (~empty_infifo) & (cfg_coff_en | data_req_padding);

fifo_acc input_fifo (
  .rst(rst_infifo),
  .wr_clk(wr_clk_infifo),
  .rd_clk(rd_clk_infifo),
  .din(din_infifo),            
  .wr_en(wren_infifo),         
  .rd_en(rden_infifo),         
  .dout(dout_infifo),          
  .full(full_infifo),          
  .empty(empty_infifo),        
  .valid(valid_infifo),
  .almost_empty(almost_empty_infifo),
  .almost_full(almost_full_infifo),
  .wr_rst_busy(wr_rst_busy_infifo),
  .rd_rst_busy(rd_rst_busy_infifo) 
);

// Configuration and Status Register

assign cfg_reg0  = reg0;
assign cfg_reg1  = reg1;
assign reg2 = stat_reg0;
assign reg3 = stat_reg1;
 
always@(posedge clk_acc) begin
if(~(rst_n_AXI | system_ready)) begin
	cfg_coff_en_r <= 0;
	cfg_data_en_r <= 0;
	rd_result_en_r <= 0;
	cfg_coff_en_rise <= 0;
	cfg_data_en_rise <= 0;
	rd_result_en_rise <= 0;
end
else begin
	cfg_coff_en_r <= {cfg_coff_en_r[8:0], cfg_coff_en};
	cfg_data_en_r <= {cfg_data_en_r[8:0], cfg_data_en};
	rd_result_en_r <= {rd_result_en_r[8:0], rd_result_en};
	cfg_coff_en_rise <= cfg_coff_en & (~cfg_coff_en_r[1]);
	cfg_data_en_rise <= cfg_data_en & (~cfg_data_en_r[1]);
	rd_result_en_rise <= rd_result_en & (~rd_result_en_r[1]);
end
end

configurator configurator_inst
(
	.clk(clk_acc),
	.rst_n(rst_n_AXI & system_ready),
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


// Padding SubModule

assign clk_padding = clk_acc;
assign rst_n_Index_padding = ~cfg_data_en_rise;
assign rst_n_padding = rst_n_AXI & system_ready & rst_n_Index_padding; //复位padding的index
assign start_padding = cfg_data_en_r[8]&(~cfg_data_en_r[9]);
assign data_in_padding = dout_infifo;
assign data_in_valid_padding = valid_infifo & cfg_data_en; //只接受图像数据，不接受卷积核系数

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

assign clk_cw = clk_acc;
assign rst_n_Index_cw = ~cfg_data_en_rise;
assign rst_n_cw = rst_n_AXI & system_ready & rst_n_Index_cw;
assign data_in_cw = cfg_coff_en ? dout_infifo : data_out_padding;
assign data_in_valid_cw = cfg_coff_en ? valid_infifo : data_out_valid_padding;

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


// Block RAM and MAC

assign clk_bm = clk_acc;
assign rst_n_bm = system_ready;
assign rst_index_bm = cfg_data_en_rise | rd_result_en_rise; //开始读/取数据时复位index
assign ena_bm = system_ready;
assign data_in_bm = data_out_cw;
assign data_in_valid_bm = data_out_valid_cw;
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
	.complete(complete_bm_rd), //到bram的index末尾拉高1拍
	.rden(rden_bm),
	.data_out(data_out_bm),
	.data_out_valid(data_out_valid_bm),
	.bram_mac_en(bram_mac_en)
);

// Output FIFO: First Word Fall Through

assign rst_outfifo = ~rst_n_AXI;
assign wr_clk_outfifo = clk_acc;
assign rd_clk_outfifo = clk_ps;
assign din_outfifo = data_out_bm;
assign wren_outfifo = data_out_valid_bm;
assign rden_outfifo = S_AXIS_S2MM_0_tready;

fifo_acc output_fifo 
(
  .rst(rst_outfifo),
  .wr_clk(wr_clk_outfifo),
  .rd_clk(rd_clk_outfifo),
  .din(din_outfifo),            
  .wr_en(wren_outfifo),         
  .rd_en(rden_outfifo),         
  .dout(dout_outfifo),          
  .full(full_outfifo),          
  .empty(empty_outfifo),        
  .valid(valid_outfifo),
  .almost_empty(almost_empty_outfifo),
  .almost_full(almost_full_outfifo),
  .wr_rst_busy(wr_rst_busy_outfifo),
  .rd_rst_busy(rd_rst_busy_outfifo) 
);

// AXI Bus Configuration

assign S_AXIS_S2MM_0_tdata = dout_outfifo;
assign S_AXIS_S2MM_0_tkeep = 4'b1111;
assign S_AXIS_S2MM_0_tvalid = valid_outfifo;
assign S_AXIS_S2MM_0_tlast = rd_result_last & valid_sf;
assign M_AXIS_MM2S_0_tready = (~almost_full_infifo);

fifo_signal_transfer fifo_signal_transfer_inst 
(
  .rst(rst_outfifo),          
  .wr_clk(wr_clk_outfifo),    
  .rd_clk(rd_clk_outfifo),    
  .din(complete_bm_rd),                  
  .wr_en(wren_outfifo),       
  .rd_en(rden_outfifo),      
  .dout(rd_result_last),                
  .valid(valid_sf)            
);


// Status Register
// stat_reg0[0]==1 表示system_ready
// stat_reg1[1]==1 表示卷积完成：complete_cw时拉高，rst_index_bm时拉低
// stat_reg1[2]==1 表示bram结果读取完成：complete_bm_rd时拉高，rst_index_bm时拉低
//
always@(posedge clk_acc)
if(~(system_ready&rst_n_AXI)) begin
	stat_reg0[1] <= 0;
	stat_reg0[2] <= 0;
end
else if(rst_index_bm) begin
	stat_reg0[1] <= 0;
	stat_reg0[2] <= 0;
end
else begin
	if(complete_cw)
		stat_reg0[1] <= 1;
	if(complete_bm_rd)
		stat_reg0[2] <= 1;
end

always@(*) begin
	stat_reg0[0] = system_ready;
end

endmodule

//template
/*
Conv_Acc Conv_Acc_inst
    (
    .clk_ps(clk),
	.clk_pl_50M(clk_pl_50M),
    .M_AXIS_MM2S_0_tdata(M_AXIS_MM2S_0_tdata),
    .M_AXIS_MM2S_0_tkeep(M_AXIS_MM2S_0_tkeep),
    .M_AXIS_MM2S_0_tlast(M_AXIS_MM2S_0_tlast),
    .M_AXIS_MM2S_0_tready(M_AXIS_MM2S_0_tready),
    .M_AXIS_MM2S_0_tvalid(M_AXIS_MM2S_0_tvalid),    
    .S_AXIS_S2MM_0_tdata(S_AXIS_S2MM_0_tdata),
    .S_AXIS_S2MM_0_tkeep(S_AXIS_S2MM_0_tkeep),
    .S_AXIS_S2MM_0_tlast(S_AXIS_S2MM_0_tlast),
    .S_AXIS_S2MM_0_tready(S_AXIS_S2MM_0_tready),
    .S_AXIS_S2MM_0_tvalid(S_AXIS_S2MM_0_tvalid),
    .mm2s_prmry_reset_out_n_0(mm2s_prmry_reset_out_n_0),    
    .s2mm_prmry_reset_out_n_0(s2mm_prmry_reset_out_n_0),    
    .reg0(reg0),
	.reg1(reg1),
	.reg2(reg2),
	.reg3(reg3)
    ); 
*/	
	

