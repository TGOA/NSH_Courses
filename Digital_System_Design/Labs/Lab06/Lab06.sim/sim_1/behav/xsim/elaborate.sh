#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sun Nov 24 16:30:10 +03 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 16f7cde431754f80bb186790a1fb6b71 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_fixed_point_adder_behav xil_defaultlib.tb_fixed_point_adder xil_defaultlib.glbl -log elaborate.log"
xelab -wto 16f7cde431754f80bb186790a1fb6b71 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_fixed_point_adder_behav xil_defaultlib.tb_fixed_point_adder xil_defaultlib.glbl -log elaborate.log
