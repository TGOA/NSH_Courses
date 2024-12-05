onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+tb_FPGA -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tb_FPGA xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {tb_FPGA.udo}

run -all

endsim

quit -force
