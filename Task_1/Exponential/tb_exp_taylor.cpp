#include "Vexp_taylor.h"
#include "verilated.h"
#include "verilated_vcd_c.h" // For VCD tracing
#include <iostream>
#include <cstdlib> // For atof()

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    double input_x = (argc >= 2) ? atof(argv[1]) : 1.0;

    Vexp_taylor* top = new Vexp_taylor;
    VerilatedVcdC* tfp = new VerilatedVcdC;

    Verilated::traceEverOn(true);      // Enable tracing
    top->trace(tfp, 99);               // Trace all levels
    tfp->open("waveform.vcd");         // Open VCD file

    top->clk = 0;
    top->rst = 1;
    top->start = 0;
    top->x = input_x;

    for (int i = 0; i < 2; ++i) {
        top->clk = !top->clk;
        top->eval();
        tfp->dump(i);
    }

    top->rst = 0;
    top->start = 1;

    int cycle = 2;
    while (!top->done && cycle < 500) {
        top->clk = !top->clk;
        top->eval();
        tfp->dump(cycle++);
    }

    std::cout << "Computed exp(" << input_x << ") approx = " << top->result << std::endl;

    tfp->close();        // Close VCD file
    delete tfp;
    delete top;

    return 0;
}

