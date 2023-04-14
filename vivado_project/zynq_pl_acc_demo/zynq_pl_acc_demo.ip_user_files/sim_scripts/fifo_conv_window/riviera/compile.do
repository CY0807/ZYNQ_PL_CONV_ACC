vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/fifo_generator_v13_2_4

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap fifo_generator_v13_2_4 riviera/fifo_generator_v13_2_4

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

vlog -work xil_defaultlib  -sv2k12 "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/ip/fifo_conv_window/sim/fifo_conv_window.v" \

vlog -work xil_defaultlib \
"glbl.v"

