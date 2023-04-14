-makelib ies_lib/xilinx_vip -sv \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../zynq_pl_acc_demo.srcs/sources_1/ip/pll/pll_clk_wiz.v" \
  "../../../../zynq_pl_acc_demo.srcs/sources_1/ip/pll/pll.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

