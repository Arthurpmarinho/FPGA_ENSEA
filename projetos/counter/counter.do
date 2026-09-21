quit -sim

vlib work

vcom counter.vhdl
vcom counter_tb.vhdl

vsim -c work.counter_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow uut/clk
add wave -color yellow uut/reset
add wave -color yellow uut/enable

# OUTPUTS
add wave -divider Outputs:
add wave uut/count

run 70 ns
