# VHDL labs at ENSEA

[![VHDL testbenches](https://github.com/Arthurpmarinho/FPGA_ENSEA/actions/workflows/testbenches.yml/badge.svg)](https://github.com/Arthurpmarinho/FPGA_ENSEA/actions/workflows/testbenches.yml)

VHDL modules I wrote for the FPGA course at ENSEA (Cergy, France), each one with its own testbench.
They were simulated in ModelSim and synthesized with Quartus. Every testbench also runs on GHDL in GitHub Actions on each push.

## Modules

| Module | What it does | Folder |
| --- | --- | --- |
| HDMI timing controller | Generates HSYNC, VSYNC and data enable for 720x480, plus pixel address and x/y counters for the pixel generator. All timings are generics | [`projetos/HDMI`](projetos/HDMI) |
| ALU | 8-bit ALU built from a logic unit (AND, OR, XOR, NOT) and an arithmetic unit (add, subtract, multiply, divide), selected by a 3-bit opcode. Bus width is a generic | [`projetos/ALU`](projetos/ALU) |
| Shift register | 4-stage serial shift register with enable and asynchronous reset | [`projetos/fifo`](projetos/fifo) |
| Counter | 4-bit synchronous counter with enable and asynchronous reset | [`projetos/counter`](projetos/counter) |
| D flip-flop | D flip-flop with enable and asynchronous reset | [`projetos/ffd`](projetos/ffd) |
| Decoder | 2-to-4 decoder | [`projetos/decoder`](projetos/decoder) |
| Multiplexer | 2-to-1 multiplexer on a generic-width bus | [`projetos/mux`](projetos/mux) |
| ModelSim tutorial | Switch to LED passthrough, used to learn the tool flow | [`projetos/1-tuto_modelsim`](projetos/1-tuto_modelsim) |

## Running the testbenches

With [GHDL](https://github.com/ghdl/ghdl) installed:

```bash
bash scripts/run_testbenches.sh
```

The script compiles each folder, elaborates its `*_tb` entity and fails if any `assert ... severity error` fires.

In ModelSim, open a folder and run its `.do` file, for example `do ALU.do`. It compiles the sources in order, opens the wave window and runs to the end.

## Tools

VHDL-2008 · ModelSim · Quartus · GHDL · GitHub Actions
