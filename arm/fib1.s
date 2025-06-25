// Jacob Panov

// Recursive Fibonacci implementation.

.global _start
_start:
    mov r0, #4
    bl fib
    1: b 1b

.global fib
fib:
    push {r4-r5, lr}
    cmp r0, #1
    bls base
    mov r4, r0          // save n
    sub r0, r0, #1
    bl fib              // fib(n-1)
    mov r5, r0          // save result
    sub r0, r4, #2
    bl fib              // fib(n-2)
    add r0, r0, r5
    pop {r4-r5, lr}
    bx lr
base:
    mov r0, #1
    pop {r4-r5, lr}
    bx lr
