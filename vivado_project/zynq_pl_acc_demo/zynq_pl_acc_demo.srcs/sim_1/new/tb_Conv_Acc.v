`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/13 10:31:27
// Design Name: 
// Module Name: tb_Conv_Acc
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


module tb_Conv_Acc(

    );

// Clock and Reset
reg clk_ps, rst_n;
initial begin
	clk_ps = 1;
end
always #5 clk_ps = ~clk_ps;

// AXI MM2S
wire M_AXIS_MM2S_0_tkeep = 4'b1111;
reg [31:0] M_AXIS_MM2S_0_tdata;
reg M_AXIS_MM2S_0_tlast, M_AXIS_MM2S_0_tvalid, S_AXIS_S2MM_0_tready;

// AXI S2MM
wire M_AXIS_MM2S_0_tready, S_AXIS_S2MM_0_tlast, S_AXIS_S2MM_0_tvalid;
wire [31:0] S_AXIS_S2MM_0_tdata;
wire [3:0] S_AXIS_S2MM_0_tkeep;

// four regs
reg [31:0] cfg_reg0, cfg_reg1;
wire [31:0] stat_reg0, stat_reg1;

// simulation logic

reg img_data_en; //传输图像数据而不是卷积核数据

initial begin
	rst_n = 0;
	S_AXIS_S2MM_0_tready = 1;
	M_AXIS_MM2S_0_tvalid = 0;
	M_AXIS_MM2S_0_tdata = 0;
	M_AXIS_MM2S_0_tlast = 0;
	cfg_reg0 = 0;
	cfg_reg1 = 0;
	img_data_en	= 0;
	# 505
	rst_n = 1;
	# 1000
	
	// configure the pll accelerator
	# 50
	cfg_reg0 = 1;
	cfg_reg1 = 10;//设置输入图像宽度
	# 50
	cfg_reg0 = 2;
	cfg_reg1 = 10;//设置输入图像高度
	# 50
	cfg_reg0 = 5;
	cfg_reg1 = 0;//设置输入定点数的小数位数
	# 50
	cfg_reg0 = 6;
	cfg_reg1 = 0;//设置使能bram的mac功能
	# 50
	cfg_reg0 = 7;
	cfg_reg1 = 0;//设置使能读取结果
	# 50
	cfg_reg0 = 3;
	cfg_reg1 = 1;//设置输入图像卷积核
	# 50
	M_AXIS_MM2S_0_tvalid = 1;
	M_AXIS_MM2S_0_tdata = 1;
	# 90
	M_AXIS_MM2S_0_tdata = 0;
	# 10
	M_AXIS_MM2S_0_tvalid = 0;
	# 200
	cfg_reg1 = 0;
	# 100
	
	img_data_en = 1;
	cfg_reg0 = 4;
	cfg_reg1 = 1;//设置输入图像数据
	# 50
	M_AXIS_MM2S_0_tdata = 1;
	M_AXIS_MM2S_0_tvalid = 1;
	# 990
	M_AXIS_MM2S_0_tlast = 1;
	# 10
	M_AXIS_MM2S_0_tlast = 0;
	M_AXIS_MM2S_0_tvalid = 0;
	
	wait((stat_reg0[1]==1));
	# 100
	img_data_en = 0;
	cfg_reg0 = 4;
	cfg_reg1 = 0;//设置输入图像数据
	M_AXIS_MM2S_0_tdata = 0;
	# 100
	cfg_reg0 = 7;
	cfg_reg1 = 1;
	
	wait((stat_reg0[2]==1));
	# 100
	cfg_reg0 = 7;
	cfg_reg1 = 0;	
	# 100
	$finish;
	
end

always@(posedge clk_ps or negedge rst_n) begin
	if(~rst_n) begin
		M_AXIS_MM2S_0_tdata <= 0;
	end
	else if(M_AXIS_MM2S_0_tvalid & S_AXIS_S2MM_0_tready & img_data_en) begin
		M_AXIS_MM2S_0_tdata <= M_AXIS_MM2S_0_tdata + 1;
	end
end

Conv_Acc Conv_Acc_inst
    (
    .clk_ps(clk_ps),
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
    .mm2s_prmry_reset_out_n_0(rst_n),    
    .s2mm_prmry_reset_out_n_0(rst_n),    
    .reg0(cfg_reg0),
	.reg1(cfg_reg1),
	.reg2(stat_reg0),
	.reg3(stat_reg1)
    ); 


endmodule
