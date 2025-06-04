# Onur Mutlu Lecture L5
## Key Takeaways
## Top-Down vs Bottom-Up Design

| **Aspect**          | **Top-Down**                          | **Bottom-Up**                        |
|----------------------|---------------------------------------|---------------------------------------|
| **Approach**         | Decompose system → submodules → leaf cells | Compose leaf cells → submodules → system |
| **Starting Point**   | High-level specifications             | Existing primitive components (gates, cells) |
| **Pros**            | Early architecture exploration        | Reuses verified components           |
| **Cons**            | Risk of unrealistic partitioning      | May miss optimal high-level structure |
| **When to Use**     | New designs, complex systems          | Legacy systems, ASIC/FPGA flows      |



## Module Declaration Basics
```verilog
module example (a, b, c, y);
  input a, b, c;       // Single-bit inputs
  output y;            // Single-bit output
  assign y = ~a & ~b | c;  // Combinational logic
endmodule
```

## Two Implementation Styles
### 1. Structural (Gate-Level)
```verilog
module mux2(input d0, d1, s, output y);
  wire ns, y1, y2;
  
  not g1(ns, s);          // Gate instantiation
  and g2(y1, d0, ns);
  and g3(y2, d1, s);
  or g4(y, y1, y2);
endmodule
```

### 2. Behavioral
```verilog
module mux4(input [3:0] d0,d1,d2,d3,
            input [1:0] s,
            output reg [3:0] y);
  always @(*) begin
    case(s)
      2'b00: y = d0;
      2'b01: y = d1;
      2'b10: y = d2;
      2'b11: y = d3;
    endcase
  end
endmodule
```

## Key Verilog Constructs
### Conditional Assignments

```verilog
// Ternary operator
assign y = sel ? a : b;

// Nested ternary
assign y = s1 ? (s0 ? d3 : d2) 
             : (s0 ? d1 : d0);
```

### Parameterized Modules
```verilog
module mux2 #(parameter WIDTH=8) (
  input [WIDTH-1:0] d0, d1,
  input s,
  output [WIDTH-1:0] y
);
  assign y = s ? d1 : d0;
endmodule

// Instantiation with parameter override
mux2 #(16) wide_mux(.d0(a), .d1(b), .s(sel), .y(out));
```

### Sequential Logic
```verilog
// D Flip-Flop
always @(posedge clk) begin
  q <= d;
end

// Async Reset FF
always @(posedge clk, negedge reset_n) begin
  if (!reset_n) q <= 0;
  else q <= d;
end

// Sync Reset FF
always @(posedge clk) begin
  if (reset) q <= 0;
  else q <= d;
end
```

## D Flip-Flop with Enable and Reset

```verilog
module flop_en_ar (
  input clk,
  input reset,
  input en,
  input [3:0] d,
  output reg [3:0] q
);
  always @ (posedge clk, negedge reset) begin
    if (reset == 1'b0)
      q <= 4'b0000;         // when reset
    else if (en)
      q <= d;               // when enable is 1 on rising clock
  end
endmodule
```

### D Latch
```verilog
module latch (
  input clk,
  input [3:0] d,
  output reg [3:0] q
);
  always @ (clk, d)
    if (clk)
      q <= d; // latch is transparent when clk is high
endmodule

```


###  Summary: always Block
- if ... else can only be used inside always blocks.

- An always block is combinational only if all outputs are assigned in all paths.

- Use default in case statements to avoid unintended latches.

- Use casex to handle don’t care conditions (x or z).

## Blocking vs Non-Blocking Assignments

### Non-blocking (<=)
``` verilog
always @ (a) begin
  a <= 2'b01;
  b <= a;  // b gets OLD value of a
end

```

- Assignments happen at the end of the block.

- All updates are scheduled in parallel.

- Ideal for sequential logic.

### Blocking (=)

```verilog
always @ (a) begin
  a = 2'b01;
  b = a;  // b gets NEW value of a
end

```


- Assignments happen immediately.

- Blocks execution until complete.

- Ideal for step-by-step operations.


## Tips:

- For registers (state-holding elements): Use <= inside always @(posedge clk).
- For combinational logic: Use = inside always @(*) or assign.
- Avoid mixing = and <= in the same always block.


##  Conclusion
So far we have studied in lecture L5
- Compared top-down vs bottom-up design approaches and their trade-offs.

- Covered Verilog basics: module syntax, structural vs behavioral styles, and parameterization.

- Explained sequential logic with flip-flops, latches, and proper use of always blocks.

- Highlighted the difference between blocking and non-blocking assignments and when to use each.
---

##  Reference
https://www.youtube.com/watch?v=3Sqt0GIFPbc&list=PL5Q2soXY2Zi9Eo29LMgKVcaydS7V1zZW3&index=7&pp=iAQB
