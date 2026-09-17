quit -sim

vlib work

vcom ffd.vhdl
vcom ffd_tb.vhdl

vsim work.ffd_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow uut/clk
add wave -color yellow uut/d
add wave -color yellow uut/enable
add wave -color yellow uut/reset

# OUTPUTS
add wave -divider Outputs:
add wave uut/q

run 100 ns
