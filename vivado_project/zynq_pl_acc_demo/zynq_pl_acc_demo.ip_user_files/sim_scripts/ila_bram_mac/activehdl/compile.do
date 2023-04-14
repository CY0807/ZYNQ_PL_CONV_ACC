vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xilinx_vip  -sv2k12 "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/ip/ila_bram_mac/hdl/verilog" "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/ip/ila_bram_mac/hdl/verilog" "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/ip/ila_bram_mac/sim/ila_bram_mac.v" \

vlog -work xil_defaultlib \
"glbl.v"

