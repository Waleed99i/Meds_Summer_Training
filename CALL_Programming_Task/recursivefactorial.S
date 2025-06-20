.section .text
.globl _start

_start:
    la sp, stack_top             # Set up the stack pointer

    la a0, num                   # Load address of input number
    ld a0, 0(a0)                 # Load 64-bit number into a0

    jal ra, factorial            # Call factorial recursively

    la t0, result
    sd a0, 0(t0)                 # Save the result

    j write_tohost               # End program (for SPIKE)

# Recursive factorial function
factorial:
    addi sp, sp, -24             # Make space on stack
    sd ra, 16(sp)                # Save return address
    sd a0, 8(sp)                 # Save argument

    li t0, 1
    ble a0, t0, base_case        # If a0 <= 1, go to base case

    addi a0, a0, -1              # a0 = a0 - 1
    jal ra, factorial            # Recursive call

    ld t1, 8(sp)                 # Restore original a0
    mul a0, a0, t1               # Multiply result

    j end_factorial

base_case:
    li a0, 1                     # Base case: return 1

end_factorial:
    ld ra, 16(sp)                # Restore return address
    addi sp, sp, 24              # Clean up stack
    ret

# Exit code for bare-metal SPIKE
write_tohost:
    li t5, 1
    la t0, tohost
    sd t5, 0(t0)
    j write_tohost              # Infinite loop (halt)

.section .data
.align 8
num:    .dword 5                 # Input value
result: .dword 0                # Output value

.section .bss
.align 16
stack_bottom: .skip 4096        # Reserve 4KB for stack
.global stack_top
stack_top:

.section ".tohost", "aw", @progbits
.align 8
.global tohost
tohost: .dword 0
.align 8
.global fromhost
fromhost: .dword 0

