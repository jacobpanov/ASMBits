// Jacob Panov

// Recursive Fibonacci implementation.

.global _start
_start:
    mov r0, #10
    bl fib1
    1: b 1b

.global fib1
fib1:
    push {r4-r5, lr}
    cmp r0, #1
    ble base
    mov r4, r0          // save n
    sub r0, r0, #1
    bl fib1             // fib(n-1)
    mov r5, r0          // save result
    sub r0, r4, #2
    bl fib1             // fib(n-2)
    add r0, r0, r5
    pop {r4-r5, lr}
    bx lr
base:
    pop {r4-r5, lr}
    bx lr
