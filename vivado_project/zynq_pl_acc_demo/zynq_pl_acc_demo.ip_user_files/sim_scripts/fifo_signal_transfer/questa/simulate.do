onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_signal_transfer_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_signal_transfer.udo}

run -all

quit -force
