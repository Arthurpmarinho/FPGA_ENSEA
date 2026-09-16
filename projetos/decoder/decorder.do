quit -sim

vlib work

vcom decoder.vhd
vcom decoder_tb.vhd

vsim -c work.decoder_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow uut/input

# OUTPUTS
add wave -divider Outputs:
add wave uut/output

run -all