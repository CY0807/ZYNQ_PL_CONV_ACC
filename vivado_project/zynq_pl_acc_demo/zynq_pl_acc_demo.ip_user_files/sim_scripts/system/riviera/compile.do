vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_5
vlib riviera/processing_system7_vip_v1_0_7
vlib riviera/lib_pkg_v1_0_2
vlib riviera/fifo_generator_v13_2_4
vlib riviera/lib_fifo_v1_0_13
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_datamover_v5_1_21
vlib riviera/axi_sg_v4_1_12
vlib riviera/axi_dma_v7_1_20
vlib riviera/xlconstant_v1_1_6
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/smartconnect_v1_0
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_19
vlib riviera/axi_data_fifo_v2_1_18
vlib riviera/axi_crossbar_v2_1_20
vlib riviera/xlconcat_v2_1_3
vlib riviera/axi_protocol_converter_v2_1_19
vlib riviera/gigantic_mux

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_5 riviera/axi_vip_v1_1_5
vmap processing_system7_vip_v1_0_7 riviera/processing_system7_vip_v1_0_7
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_4 riviera/fifo_generator_v13_2_4
vmap lib_fifo_v1_0_13 riviera/lib_fifo_v1_0_13
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_21 riviera/axi_datamover_v5_1_21
vmap axi_sg_v4_1_12 riviera/axi_sg_v4_1_12
vmap axi_dma_v7_1_20 riviera/axi_dma_v7_1_20
vmap xlconstant_v1_1_6 riviera/xlconstant_v1_1_6
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_19 riviera/axi_register_slice_v2_1_19
vmap axi_data_fifo_v2_1_18 riviera/axi_data_fifo_v2_1_18
vmap axi_crossbar_v2_1_20 riviera/axi_crossbar_v2_1_20
vmap xlconcat_v2_1_3 riviera/xlconcat_v2_1_3
vmap axi_protocol_converter_v2_1_19 riviera/axi_protocol_converter_v2_1_19
vmap gigantic_mux riviera/gigantic_mux

vlog -work xilinx_vip  -sv2k12 "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"E:/Vivado/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/Vivado/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/Vivado/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/Vivado/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/Vivado/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/Vivado/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/Vivado/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/Vivado/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/Vivado/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"E:/Vivado/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Vivado/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"E:/Vivado/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/Vivado/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_5  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_7  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -93 \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_13 -93 \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/4dac/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_21 -93 \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/e644/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_12 -93 \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/91f3/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_20 -93 \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/260a/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_axi_dma_0_0/sim/system_axi_dma_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/sim/bd_44e3.v" \

vlog -work xlconstant_v1_1_6  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/66e7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_0/sim/bd_44e3_one_0.v" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_1/sim/bd_44e3_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_2/sim/bd_44e3_arsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_3/sim/bd_44e3_rsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_4/sim/bd_44e3_awsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_5/sim/bd_44e3_wsw_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_6/sim/bd_44e3_bsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_7/sim/bd_44e3_s01mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_8/sim/bd_44e3_s01tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/7de4/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_9/sim/bd_44e3_s01sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_10/sim/bd_44e3_s01a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_11/sim/bd_44e3_sarn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_12/sim/bd_44e3_srn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_13/sim/bd_44e3_s02mmu_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_14/sim/bd_44e3_s02tr_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_15/sim/bd_44e3_s02sic_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_16/sim/bd_44e3_s02a2s_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_17/sim/bd_44e3_sawn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_18/sim/bd_44e3_swn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_19/sim/bd_44e3_sbn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_20/sim/bd_44e3_m00s2a_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_21/sim/bd_44e3_m00arn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_22/sim/bd_44e3_m00rn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_23/sim/bd_44e3_m00awn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_24/sim/bd_44e3_m00wn_0.sv" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_25/sim/bd_44e3_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_26/sim/bd_44e3_m00e_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_smc_0/sim/system_axi_smc_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/system/ip/system_rst_ps7_0_100M_0/sim/system_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_19  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_18  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_20  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xbar_0/sim/system_xbar_0.v" \

vlog -work xlconcat_v2_1_3  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xlconcat_0_0/sim/system_xlconcat_0_0.v" \
"../../../bd/system/sim/system.v" \
"../../../bd/system/ipshared/f4ee/hdl/myip_v1_0_S00_AXI.v" \
"../../../bd/system/ipshared/f4ee/hdl/myip_v1_0.v" \
"../../../bd/system/ip/system_myip_0_1/sim/system_myip_0_1.v" \

vlog -work axi_protocol_converter_v2_1_19  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \
"../../../bd/system/ip/system_system_ila_0_0/bd_0/ip/ip_0/sim/bd_d5b8_ila_lib_0.v" \

vlog -work gigantic_mux  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/d322/hdl/gigantic_mux_v1_0_cntr.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/8c62/hdl" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1ddd/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/b2d0/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ip/system_processing_system7_0_0" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/122e/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/6887/hdl/verilog" "+incdir+../../../../zynq_pl_acc_demo.srcs/sources_1/bd/system/ipshared/9623/hdl/verilog" "+incdir+E:/Vivado/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_system_ila_0_0/bd_0/ip/ip_1/bd_d5b8_g_inst_0_gigantic_mux.v" \
"../../../bd/system/ip/system_system_ila_0_0/bd_0/ip/ip_1/sim/bd_d5b8_g_inst_0.v" \
"../../../bd/system/ip/system_system_ila_0_0/bd_0/sim/bd_d5b8.v" \
"../../../bd/system/ip/system_system_ila_0_0/sim/system_system_ila_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

