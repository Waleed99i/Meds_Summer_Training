# Onur Mutlu Lecture L2

## Key Takeaways


### 1. Types of Logic Circuits
| **Combinational** | **Sequential** |
|--------------------|----------------|
| Memoryless | Contains memory elements |
| Output = f(current inputs) | Output = f(current + past inputs) |
| e.g., AND, OR gates | e.g., Flip-flops, registers |

### 2. Functional Specification
- **Definition**: Mathematical mapping of inputs → outputs
- **Properties**:
  - Deterministic (same input → same output)
  - Stateless (no memory)
- **Example**: 1-bit Full Adder


### 3. Boolean Algebra Fundamentals
#### Basic Gates:
| Gate |   Boolean Expression condition for TRUE|
|------|-------------------------|
| NOT |  ~A =1 iff A=0 |
| AND |  A•B = 1 iff A=B=1 |
| OR |  A+B = 1 if either A OR B=1 |

#### 4.Key Terms:
- **Literal**: Variable or its complement (A, A̅)
- **Implicant**: AND of literals (A•B•C̅)
- **Minterm**: AND with all variables (A•B•C)
- **Maxterm**: OR with all variables (A+B+C)

### 5. Canonical Forms
#### Sum-of-Products (SOP):
- **Format**: OR of minterms

#### Product-of-Sums (POS):
- **Format**: AND of maxterms
- **Dual** to SOP form


### 6. Decoders
- **Function**: 
  - Detects specific input patterns (n inputs → 2ⁿ outputs)
  - Only one output is HIGH (1) at any time
- **Example**: 2-to-4 Decoder
  | A1 A0 | Y3 Y2 Y1 Y0 |
  |-----|-------------|
  | 0 0 | 0  0  0  1  |
  | 0 1 | 0  0  1  0  |
  | 1 0 | 0  1  0  0  |
  | 1 1 | 1  0  0  0  |
- **Applications**:
  - Memory address decoding
  - Instruction opcode interpretation

### 7. Multiplexers (MUX)
- **Function**: 
  - Selects one of N inputs based on control signals (log₂N select lines)
  - Acts as a digital switch
- **Example**: 2-to-1 MUX



### 8. PLA (Programmable Logic Array)

### Logic Implementation Techniques


- **Structure**:
- AND plane (generate minterms) → OR plane (combine minterms)
- **Programming**:
- Configure connections to implement custom SOP expressions


### 9. Full Adder Design
- **Function**: Performs 1-bit addition with carry-in/out



### 10. Arithmetic Logic Unit (ALU)
- **Capabilities**:
- Arithmetic operations (add, subtract)
- Logical operations (AND, OR, XOR)
- Comparison operations
- **Key Feature**: Shared hardware for multiple operations




## Conclusion
So far we have studied:
- Combinational logic forms foundation for digital design
- SOP/POS provide systematic ways to represent Boolean functions
- Decoders/MUXes enable efficient input selection and pattern detection
- PLAs provide flexible SOP implementation
- ALUs combine arithmetic/logic operations in a unified unit


## Reference
https://www.youtube.com/watch?v=U-4jmbm8inw&list=PL5Q2soXY2Zi9Eo29LMgKVcaydS7V1zZW3&index=2&pp=iAQB