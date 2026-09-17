quit -sim

vlib work

vcom fifo.vhdl
vcom fifo_tb.vhdl

vsim -c work.fifo_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow uut/clk
add wave -color yellow uut/reset
add wave -color yellow uut/enable
add wave -color yellow uut/data_in

# INTERNALS
add wave -divider Internals:
add wave -color cyan uut/buffer_s

# OUTPUTS
add wave -divider Outputs:
add wave uut/data_out

run 90 ns
