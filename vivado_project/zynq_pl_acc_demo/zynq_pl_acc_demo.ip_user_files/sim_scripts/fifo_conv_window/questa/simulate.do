onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_conv_window_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_conv_window.udo}

run -all

quit -force
