// Jacob Panov

// Demonstrates preserving callee-saved registers in a function.
// times10 multiplies its argument by 10 and returns the result.

.global _start
_start:
    mov r0, #5
    bl times10
    1: b 1b

.global times10
times10:
    push {r4, lr}
    mov r4, #10
    mul r0, r4, r0
    pop {r4, lr}
    bx lr
