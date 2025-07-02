// Jacob Panov

// Compute memory size given address and data line counts.

.global _start
_start:
        ldr r0, =12     // 12 address lines
        ldr r1, =8      // 8 data lines
        bl memsize
1:      b 1b    // Done

memsize:
    mov r2, #1           // 1 << address lines
    lsl r2, r2, r0
    mul r0, r2, r1       // capacity in bits
    bx lr
