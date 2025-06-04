# Onur Mutlu Lecture L3

## Key Takeaways

## 1 --> Combinational Logic Recap

### Key Combinational Blocks
| **Block**          | **Function**                              | **Key Properties**                     |
|---------------------|------------------------------------------|----------------------------------------|
| Basic Gates         | AND, OR, NOT, NAND, NOR, XOR             | Logical completeness (NAND/NOR alone) |
| Decoder             | n-to-2ⁿ pattern detector                 | One-hot output                        |
| Multiplexer         | N-to-1 selector                          | Controlled by log₂N select lines       |
| Full Adder          | 1-bit addition with carry                | S = A⊕B⊕Cin; Cout = majority(A,B,Cin) |
| PLA                 | Programmable AND-OR array                | Implements any SOP form               |
| ALU                 | Multi-function arithmetic/logic unit     | Shared hardware for ops               |
| Tri-State Buffer    | Enables wire sharing                     | Outputs: 0, 1, or High-Z (Z)          |

### Further Concepts
1. **Logical Completeness**:
   - Any Boolean function can be implemented with:
     - {AND, OR, NOT} **or** 
     - {NAND} alone **or** 
     - {NOR} alone
  
2. **Boolean Simplification**:
   - **Uniting Theorem**: Eliminate variables that don't affect output in ON-set.
     - Example: `F = A·B̅ + A·B = A`
   - **Karnaugh Maps**: Visual simplification (covered later if time permits).

3. **Practical Blocks**:
   - **Comparator**: Checks equality of N-bit inputs.
   - **Priority Circuit**: Grants requests based on priority levels.
     - Uses "don't care" (X) conditions for optimization.

# 2 --> Sequential Logic Circuits

## Key Takeaways

### 1. Sequential vs Combinational Logic
| **Feature**         | **Combinational**               | **Sequential**                  |
|----------------------|----------------------------------|---------------------------------|
| **Memory**           | No                               | Yes (state elements)            |
| **Output Depends On**| Current inputs only              | Current + past inputs (history) |
| **Timing**           | Propagation delay only           | Clock cycles + setup/hold times |

### 2. Storage Hierarchy
| **Element**       | **Speed** | **Cost** | **Density** | **Use Case**          |
|--------------------|-----------|----------|-------------|-----------------------|
| Flip-Flops        | Fastest   | Highest  | Lowest      | CPU registers         |
| SRAM              | Fast      | High     | Medium      | Caches                |
| DRAM              | Moderate  | Low      | High        | Main memory           |
| Flash/HDD         | Slowest   | Lowest   | Highest     | Persistent storage    |

### 3. Fundamental Storage Elements

#### R-S Latch 
- **Structure**: Cross-coupled NAND gates
- **Operation**:
  - **Set (S=0, R=1)**: Q → 1
  - **Reset (R=0, S=1)**: Q → 0
  - **Forbidden**: R=S=0 (causes metastability)
- **Truth Table**:
  | R | S | Q   |
  |---|---|-----|
  | 1 | 1 | Qₚᵣₑᵥ |
  | 0 | 1 | 0   |
  | 1 | 0 | 1   |
  | 0 | 0 |  X |

#### Gated D Latch 
- **Improvement**: Adds Write Enable (WE) control
- **Behavior**:
  - WE=1: Q follows D
  - WE=0: Holds previous state


### 4. Registers & Memory

#### Registers
- **Definition**: Group of D latches with shared WE
- **Example**: 4-bit register
  ```verilog
  always @(posedge WE) begin
    Q[3:0] <= D[3:0];
  end


##   Memory Systems

### 5.Memory Organization 
- **Address Decoding**:
  - `n` address bits → `2ⁿ` locations
  - Example: 2 locations need 1-bit address (`log₂(2)=1`)
- **Read Operation**:
  - Uses multiplexer + decoder to select addressed data
- **Write Operation**:
  - Write Enable (WE) signal gates data input (`D[2:0]`) to selected address

---

##  6.Lookup Tables (LUTs) 

**Function:** Implements any N-input, M-output Boolean function.

**FPGA Usage:**  
- Reconfigurable logic blocks.

**Example:**  
- 3-input LUT for "majority function" (output = 1 when ≥2 inputs = 1).


---



### 7.D Flip-Flop 

**Structure:**  
- Master-slave latches (edge-triggered).

**Behavior:**  
- Captures `D` on rising clock edge (0→1).  
- Holds value otherwise.



**Key Advantage:**  
- Avoids transparency issues of latches.



### 8.Registers

**Implementation:**  
- Parallel D flip-flops with shared clock.


---

##  ---> Finite State Machines (FSMs)



### 9.FSM Components 

- **State Register:** Stores current state (D flip-flops).
- **Next-State Logic:** Combinational logic (inputs + current state).
- **Output Logic:**
  - **Moore:** Outputs = f(current state)
  - **Mealy:** Outputs = f(current state + inputs)

### 10.Moore vs Mealy

| **Feature**       | **Moore FSM**                          | **Mealy FSM**                          |
|--------------------|----------------------------------------|----------------------------------------|
| **Outputs Depend On** | Current state only                   | Current state + inputs                |
| **Output Timing**  | Synchronized with clock (1-cycle delay) | Changes immediately with input       |
| **Complexity**     | Simpler output logic                  | More complex (input-dependent outputs) |
| **State Diagram**  | Outputs labeled inside state circles  | Outputs on transition arrows          |
| **Use Cases**      | Traffic lights, counters              | Serial communication, control systems |






##  Conclusion
So far we have studied in lecture L3:
- Quick overview of combinational circuits
- Sequential circuits 
- FSMs model systems 

---

##  Reference

https://www.youtube.com/watch?v=smHJ1W7S-2Q&list=PL5Q2soXY2Zi9Eo29LMgKVcaydS7V1zZW3&index=3&pp=iAQB
