quit -sim

vlib work

vcom mux.vhdl
vcom mux_tb.vhdl

vsim -c work.mux_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow sim:/mux_tb/sel
add wave -color yellow sim:/mux_tb/in0
add wave -color yellow sim:/mux_tb/in1

# OUTPUTS
add wave -divider Outputs:
add wave sim:/mux_tb/led

run -all