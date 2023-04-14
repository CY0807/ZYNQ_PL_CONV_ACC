#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=D:/SoftwareRoot/Vivado2019.1/SDK/2019.1/bin;D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/ids_lite/ISE/bin/nt64;D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/ids_lite/ISE/lib/nt64:D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/bin
else
  PATH=D:/SoftwareRoot/Vivado2019.1/SDK/2019.1/bin;D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/ids_lite/ISE/bin/nt64;D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/ids_lite/ISE/lib/nt64:D:/SoftwareRoot/Vivado2019.1/Vivado/2019.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='D:/github_repo/ZYNQ_PL_CONV/vivado_project/zynq_pl_acc_demo/zynq_pl_acc_demo.runs/fifo_signal_transfer_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log fifo_signal_transfer.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source fifo_signal_transfer.tcl
