# Makefile for exp_taylor Verilator simulation

TOP_MODULE = exp_taylor
TB_FILE = tb_exp_taylor.cpp
VSRCS = exp_taylor.sv  #verilog source file

all: sim

sim:
	verilator -Wall --cc $(VSRCS) --exe $(TB_FILE) --trace  
	make -C obj_dir -j -f V$(TOP_MODULE).mk V$(TOP_MODULE)
	./obj_dir/V$(TOP_MODULE) 5.0

wave:
	gtkwave waveform.vcd

clean:
	rm -rf obj_dir *.vcd *.log

