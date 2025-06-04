# Onur Mutlu Lecture L1

## Key Takeaways

### 1. What is Computer Architecture?
- **Definition**:  
  The science and art of designing hardware components and hardware/software interfaces to meet functional, performance, energy, and cost goals.
- **Components**:  
  - Hardware design  
  - Performance optimization  
  - Energy efficiency trade-offs  


### 2. Why Study Computer Architecture?
- **Goals**:  
  - Build faster, cheaper, smaller, and more reliable systems.  
  - Enable new applications (e.g., VR, self-driving cars, personalized medicine).  


### 3. What is a Computer?
- **Core Components**:  
  1. **Computation** (CPU/GPU)  
  2. **Communication** (buses, networks)  
  3. **Storage/Memory** (DRAM, SSDs)  


### 4. Transistors: The Building Blocks
- **Evolution**:  
  - Intel 4004 (1971): 2,300 transistors  
  - Apple M2 Max (2022): 67 billion transistors  
- **Role**:  
  - SW/HW Interface → microarchitecture → Logic → devices(Transistors etc)  

### 5. MOS Transistors
#### Full Form
METAL OXIDE SEMI-CONDUCTOR
- **Types**:  
  - **n-type**: Conducts when gate voltage = 3V.  
  - **p-type**: Conducts when gate voltage = 0V.  


### 6. Logic Gates from Transistors
- **How?**:  
  - Combinations of MOS transistors create AND, OR, NOT gates.  
- **Example**:  
  - CMOS inverters use n-type + p-type pairs.  



### 7. Transistor as a Switch
- **n-type MOS Transistor**:
  - **High voltage (3V) at gate**: Source-drain connection conducts (closed circuit)
  - **0V at gate**: Connection breaks (open circuit)



- **p-type MOS Transistor**:
  - Opposite behavior to n-type: Conducts at 0V, opens at 3V.

### 8. CMOS NOT Gate (Inverter)
- **Operation**:
  - Input (A) | Output (Y)
    - 0V → 3V (logic 0 → 1)
    - 3V → 0V (logic 1 → 0)
- **Truth Table**:
  | A | Y |
  |---|---|
  | 0 | 1 |
  | 1 | 0 |
- **Symbol**: Bubble indicates inversion

### 9. CMOS NAND Gate
- **Structure**:
  - Parallel pMOS (P1, P2): Only one needs to be ON for output=1.
  - Series nMOS (N1, N2): Both must be ON for output=0.
- **Truth Table**:
  | A | B | Y |
  |---|---|---|
  | 0 | 0 | 1 |
  | 0 | 1 | 1 |
  | 1 | 0 | 1 |
  | 1 | 1 | 0 |


### 10. CMOS AND Gate
- **Implementation**: NAND + NOT gate 
- **Truth Table**:
  | A | B | Y |
  |---|---|---|
  | 0 | 0 | 0 |
  | 0 | 1 | 0 |
  | 1 | 0 | 0 |
  | 1 | 1 | 1 |



## Conclusion
- Computer architecture bridges hardware/software to solve real-world problems.  
- Transistor scaling (Moore’s Law) enables exponential performance gains.  
- Future directions: More energy-efficient designs, domain-specific architectures (e.g., AI accelerators).
- Transistors act as voltage-controlled switches to build logic gates.
- CMOS gates combine n-type/p-type transistors for low-power operation.
- Universal gates (NAND/NOR) can construct any Boolean function.

## Reference
https://www.youtube.com/live/ubhxKNlOlRg?si=VvzRR8Dt5e-Wu1NE