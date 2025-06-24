// Jacob Panov

// Demonstrates passing parameters to a function. The function
// sum4 adds four 32-bit integers passed in r0-r3 and returns
// the result in r0.

.global _start
_start:
    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    bl sum4
    1: b 1b

.global sum4
sum4:
    // r0=r0, r1=r1, r2=r2, r3=r3
    add r0, r0, r1
    add r0, r0, r2
    add r0, r0, r3
    bx lr
