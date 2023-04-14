// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Apr 13 14:26:31 2023
// Host        : HoppingKnight running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/github_repo/ZYNQ_PL_CONV/vivado_project/zynq_pl_acc_demo/zynq_pl_acc_demo.srcs/sources_1/ip/pll/pll_stub.v
// Design      : pll
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z035ffg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module pll(clk_acc, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_acc,reset,locked,clk_in1" */;
  output clk_acc;
  input reset;
  output locked;
  input clk_in1;
endmodule
