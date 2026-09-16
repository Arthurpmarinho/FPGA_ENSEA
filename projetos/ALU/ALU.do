quit -sim

vlib work

# 1. Compilação na ordem correta (módulos mais baixos primeiro)
vcom ALU_logical.vhdl
vcom ALU_arithmetic.vhdl
vcom ALU.vhdl
vcom ALU_tb.vhdl

# 2. Inicializa a simulação focando no testbench (sem a flag -c para abrir a interface gráfica)
vsim work.ALU_tb

# 3. Adiciona os sinais na janela de Wave (apontando para a hierarquia do testbench)
# INPUTS
add wave -divider Inputs:
add wave -color yellow sim:/ALU_tb/sel
add wave -color yellow sim:/ALU_tb/in0
add wave -color yellow sim:/ALU_tb/in1

# OUTPUTS
add wave -divider Outputs:
add wave sim:/ALU_tb/led

# 4. Roda a simulação até o final dos asserts
run -all