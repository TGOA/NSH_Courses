vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../VGA Controller and Drawing Circles/project_1/project_1.srcs/sources_1/new/vga_controller.v" \

vlog -work xil_defaultlib  -sv2k12 \
"../../VGA Controller and Drawing Circles/project_1/project_1.srcs/sources_1/new/FPGA.sv" \
"../../VGA Controller and Drawing Circles/project_1/project_1.srcs/sources_1/new/comparetor.sv" \
"../../VGA Controller and Drawing Circles/project_1/project_1.srcs/sources_1/new/controller2.sv" \
"../../VGA Controller and Drawing Circles/project_1/project_1.srcs/sources_1/new/counter1.sv" \
"../../VGA Controller and Drawing Circles/project_1/project_1.srcs/sources_1/new/top_module2.sv" \
"../../VGA Controller and Drawing Circles/project_1/project_1.srcs/sources_1/new/vga_core.sv" \
"../../VGA Controller and Drawing Circles/project_1/project_1.srcs/sources_1/new/video_memory.sv" \
"../../VGA Controller and Drawing Circles/project_1/project_1.srcs/sim_1/new/tb_FPGA.sv" \

vlog -work xil_defaultlib \
"glbl.v"

