TOP_MODULE = sqrt_bin_search
TB_FILE = tb_sqrt_bin_search.cpp
VSRCS = sqrt_bin_search.sv

all: sim

sim:
	verilator -Wall --cc $(VSRCS) --exe $(TB_FILE) --trace
	make -C obj_dir -j -f V$(TOP_MODULE).mk V$(TOP_MODULE)
	./obj_dir/V$(TOP_MODULE) 25

wave:
	gtkwave waveform.vcd

clean:
	rm -rf obj_dir *.vcd *.log


