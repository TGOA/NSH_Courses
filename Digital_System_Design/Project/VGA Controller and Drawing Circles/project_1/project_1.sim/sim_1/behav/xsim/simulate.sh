#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sun Dec 08 12:41:03 +03 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim tb_FPGA_behav -key {Behavioral:sim_1:Functional:tb_FPGA} -tclbatch tb_FPGA.tcl -view /home/it/Desktop/Courses/NSH_Courses/Digital_System_Design/Project/VGA Controller and Drawing Circles/project_1/tb_FPGA_time_impl.wcfg -view /home/it/Desktop/Courses/NSH_Courses/Digital_System_Design/Project/VGA Controller and Drawing Circles/project_1/tb_FPGA_behav.wcfg -log simulate.log"
xsim tb_FPGA_behav -key {Behavioral:sim_1:Functional:tb_FPGA} -tclbatch tb_FPGA.tcl -view /home/it/Desktop/Courses/NSH_Courses/Digital_System_Design/Project/VGA Controller and Drawing Circles/project_1/tb_FPGA_time_impl.wcfg -view /home/it/Desktop/Courses/NSH_Courses/Digital_System_Design/Project/VGA Controller and Drawing Circles/project_1/tb_FPGA_behav.wcfg -log simulate.log

