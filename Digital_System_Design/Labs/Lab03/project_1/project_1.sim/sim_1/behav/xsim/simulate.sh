#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Wed Nov 13 23:09:09 +03 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim tb_seven_seg_decoder_behav -key {Behavioral:sim_1:Functional:tb_seven_seg_decoder} -tclbatch tb_seven_seg_decoder.tcl -log simulate.log"
xsim tb_seven_seg_decoder_behav -key {Behavioral:sim_1:Functional:tb_seven_seg_decoder} -tclbatch tb_seven_seg_decoder.tcl -log simulate.log

