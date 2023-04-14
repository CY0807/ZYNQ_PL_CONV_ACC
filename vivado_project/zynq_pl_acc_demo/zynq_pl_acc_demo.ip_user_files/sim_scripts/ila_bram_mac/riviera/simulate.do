onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ila_bram_mac -L xilinx_vip -L xil_defaultlib -L xpm -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ila_bram_mac xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ila_bram_mac.udo}

run -all

endsim

quit -force
