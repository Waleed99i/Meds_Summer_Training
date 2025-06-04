# Onur Mutlu Lecture L4

## Key Takeaways

## Finite State Machine (FSM) Components
1. **States**: Finite set (`S0, S1,...`)  
2. **Inputs/Outputs**: External signals  
3. **Transition Logic**: `next_state = f(current_state, inputs)`  
4. **Output Logic**:  
   - Moore: `outputs = f(current_state)`  
   - Mealy: `outputs = f(current_state, inputs)`  

## FSM State Encoding Methods
| **Method**       | **Bits**          | **Example (4 states)** | **Pros**                     | **Cons**                |
|-------------------|-------------------|------------------------|------------------------------|-------------------------|
| Binary           | `log₂(states)`    | 00, 01, 10, 11         | Minimal flip-flops           | Complex output logic    |
| One-Hot          | 1 bit per state   | 0001, 0010, 0100, 1000 | Simple next-state logic      | More flip-flops         |
| Output Encoded   | Output bits       | 001(G), 010(Y), 100(R) | Minimal output logic (Moore) | Limited to Moore FSMs   |

### Synchronous vs. Asynchronous

| Feature           | Synchronous       | Asynchronous            |
|-------------------|-------------------|--------------------------|
| **Timing**        | Clock-controlled  | Event-driven             |
| **Design Complexity** | Easier for large systems | Potentially more efficient |
| **Examples**      | CPUs, RAM         | Combination locks        |

---


## ---> FSM Design Procedure

---

### 1. Define States

Example:  
`IDLE`, `CAL`, `DONE`

---

### 2. Draw State Diagram

- **Nodes** = States  
- **Edges** = Transitions  
- Label edges with: **input/output**

---

### 3. Choose Encoding

- **Binary:**  
  - Fewer flip-flops  
  - Slightly more complex logic

- **One-Hot:**  
  - One flip-flop per state  
  - Simplifies next-state logic

---

### 4. Implement in Verilog

```verilog
always @(posedge clk) begin
  if (reset)
    state <= IDLE;
  else
    state <= next_state;
end
```

## ---> Enhanced Flip-Flops

---

###  Resettable Flip-Flop

| Type               | Behavior                   | Verilog Example                                  |
|--------------------|-----------------------------|---------------------------------------------------|
| Synchronous Reset  | Resets only at clock edge   | `always @(posedge clk) if (reset) Q <= 0;`       |
| Asynchronous Reset | Resets immediately          | `always @(posedge clk or posedge reset)`         |

---

###  Settable Flip-Flop

```verilog
always @(posedge clk) begin
  if (set)
    Q <= 1;
  else
    Q <= D;
end
```


##  Conclusion
So far we have studied in lecture L4:
- FSM
- State Encodings
- FSM Design Procedure
- Resettable and Settable Flip Flops

---

##  Reference

https://www.youtube.com/watch?v=MHlj1bARKPw&list=PL5Q2soXY2Zi9Eo29LMgKVcaydS7V1zZW3&index=5&pp=iAQB0gcJCbEJAYcqIYzv


