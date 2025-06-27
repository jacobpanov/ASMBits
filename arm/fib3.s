// Jacob Panov

// Compute call count for recursive fib.

.global _start
_start:
    mov r0, #4
    bl numfib
    1: b 1b

.global numfib
numfib:
    cmp r0, #1
    bhi rec
    mov r0, #1
    bx lr
rec:
    // save registers we'll use
    push {r4, r5, lr}
    mov r4, r0        // n
    sub r0, r4, #1
    bl numfib         // numfib(n-1)
    mov r5, r0        // save result of first call
    sub r0, r4, #2
    bl numfib         // numfib(n-2)
    add r0, r0, r5
    add r0, r0, #1    // count this call
    pop {r4, r5, lr}
    bx lr
