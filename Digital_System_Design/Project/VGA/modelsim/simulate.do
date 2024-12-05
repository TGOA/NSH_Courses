onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.tb_FPGA xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {tb_FPGA.udo}

run -all

quit -force
