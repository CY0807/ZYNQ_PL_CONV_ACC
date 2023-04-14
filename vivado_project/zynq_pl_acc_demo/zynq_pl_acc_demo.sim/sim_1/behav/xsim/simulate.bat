@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu Apr 13 23:42:32 +0800 2023
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim tb_Conv_Acc_behav -key {Behavioral:sim_1:Functional:tb_Conv_Acc} -tclbatch tb_Conv_Acc.tcl -protoinst "protoinst_files/bd_44e3.protoinst" -protoinst "protoinst_files/bd_d5b8.protoinst" -protoinst "protoinst_files/system.protoinst" -view D:/github_repo/ZYNQ_PL_CONV/vivado_project/zynq_pl_acc_demo/tb_padding_behav.wcfg -log simulate.log"
call xsim  tb_Conv_Acc_behav -key {Behavioral:sim_1:Functional:tb_Conv_Acc} -tclbatch tb_Conv_Acc.tcl -protoinst "protoinst_files/bd_44e3.protoinst" -protoinst "protoinst_files/bd_d5b8.protoinst" -protoinst "protoinst_files/system.protoinst" -view D:/github_repo/ZYNQ_PL_CONV/vivado_project/zynq_pl_acc_demo/tb_padding_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
