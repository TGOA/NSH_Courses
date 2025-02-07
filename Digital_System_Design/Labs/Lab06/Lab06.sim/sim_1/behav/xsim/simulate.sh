#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sun Nov 24 16:30:11 +03 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim tb_fixed_point_adder_behav -key {Behavioral:sim_1:Functional:tb_fixed_point_adder} -tclbatch tb_fixed_point_adder.tcl -log simulate.log"
xsim tb_fixed_point_adder_behav -key {Behavioral:sim_1:Functional:tb_fixed_point_adder} -tclbatch tb_fixed_point_adder.tcl -log simulate.log

