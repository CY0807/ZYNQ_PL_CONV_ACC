vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/fifo_generator_v13_2_4

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap fifo_generator_v13_2_4 modelsim_lib/msim/fifo_generator_v13_2_4

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L xilinx_vip "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L xilinx_vip "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_4 -64 -incr "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -64 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4 -64 -incr "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/ip/fifo_signal_transfer/sim/fifo_signal_transfer.v" \

vlog -work xil_defaultlib \
"glbl.v"

