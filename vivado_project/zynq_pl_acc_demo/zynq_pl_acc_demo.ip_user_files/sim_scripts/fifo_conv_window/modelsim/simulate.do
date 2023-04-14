onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xilinx_vip -L xil_defaultlib -L xpm -L fifo_generator_v13_2_4 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.fifo_conv_window xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {fifo_conv_window.udo}

run -all

quit -force
