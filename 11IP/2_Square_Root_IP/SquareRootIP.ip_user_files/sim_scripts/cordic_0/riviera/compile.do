vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../SquareRootIP.srcs/sources_1/ip/cordic_0/cordic_0_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

