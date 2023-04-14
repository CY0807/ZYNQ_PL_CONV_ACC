connect -url tcp:127.0.0.1:3121
source D:/github_repo/ZYNQ_PL_CONV/vivado_project/zynq_pl_acc_demo/zynq_pl_acc_demo.sdk/system_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210249857699"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS1 210249857699" && level==0} -index 1
fpga -file D:/github_repo/ZYNQ_PL_CONV/vivado_project/zynq_pl_acc_demo/zynq_pl_acc_demo.sdk/system_wrapper_hw_platform_0/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210249857699"} -index 0
loadhw -hw D:/github_repo/ZYNQ_PL_CONV/vivado_project/zynq_pl_acc_demo/zynq_pl_acc_demo.sdk/system_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS1 210249857699"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS1 210249857699"} -index 0
dow D:/github_repo/ZYNQ_PL_CONV/vivado_project/zynq_pl_acc_demo/zynq_pl_acc_demo.sdk/test3/Debug/test3.elf
configparams force-mem-access 0
bpadd -addr &main
