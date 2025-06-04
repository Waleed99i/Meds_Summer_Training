# Onur Mutlu Lecture L6
## Key Takeaways

##  1. Combinational Circuit Timing

### Delay Sources

- **Transistor switching time**
- **Parasitic RC delays**
- **Wire delays**
- **Temperature/voltage variation**
- **Aging effects**

###  Timing Definitions

- **Contamination Delay (`t_cd`)**: Min time for output to _start_ changing.
- **Propagation Delay (`t_pd`)**: Max time for output to _finish_ changing.

###  Glitches

- Temporary, unwanted outputs due to unequal delays.
- Often ignored if steady-state correctness is preserved.

###  Design Implications

- **Critical path** determines **maximum clock frequency**.
- Tools help, but manual corner-case analysis is important.

---

## 2. Sequential Circuit Timing

###  Flip-Flop Timing Parameters

- **Setup Time (`t_setup`)**: Data must be stable _before_ clock edge.
- **Hold Time (`t_hold`)**: Data must remain stable _after_ clock edge.
- **Clock-to-Q Delay (`t_clkq`)**: Time between clock edge and output change.

###  Clock Skew

- Difference in clock arrival time between flip-flops.
- **Negative impact**:
  - Reduces effective hold/setup margin.
- **Solution**:
  - Balanced clock tree (e.g., H-tree networks).

---

##  3. Timing Violations and Fixes

###  Setup Violation

- **Cause**: Slow combinational logic.
- **Fixes**:
  - Reduce clock frequency
  - Optimize critical path
  - Add pipelining stages

###  Hold Violation

- **Cause**: Fast combinational logic.
- **Fix**:
  - Add delay buffers (safe, does not impact setup time).

---

##  4. Verification

###  Functional Verification

- **Testbenches**:
  - Manual or Self-checking
- **Functional Simulation**:
  - Logic-only, no delay modeling

###  Timing Verification

- **Simulation**:
  - Delays manually annotated (e.g., `#10ns`)
- **Static Timing Analysis (STA)**:
  - Tool-driven, faster than full simulation
- **Post-Synthesis Simulation**:
  - Uses gate-level delays from cell libraries

###  Formal Verification

- **Mathematical proof** of correctness
- **Model checking** ensures properties are met
- **SystemVerilog Assertions (SVA)** used for property definitions

---

##  5. Design Principles

-  **Critical Path Optimization**: Maximize frequency by shortening delay
-  **Balanced Design**: Avoid path bottlenecks
-  **Common-Case Optimization**: Optimize frequent cases
-  **Aging/Variability Tolerance**: Design for robustness under stress

---


## Conclusion
So far we have studied in this lecture is:
- Timing affects circuit speed and correctness (delays, setup/hold times).

- Setup and hold violations can be fixed by pipelining or adding delays.

- Verification includes simulation and formal methods.

- Design for balanced, optimized, and robust circuits.


## Reference
https://www.youtube.com/watch?v=DBsDuQwpPsI&list=PL5Q2soXY2Zi9Eo29LMgKVcaydS7V1zZW3&index=8&pp=iAQB


