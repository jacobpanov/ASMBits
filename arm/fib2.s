// Jacob Panov

// Iterative Fibonacci calculation.

.global _start
_start:
    mov r0, #10
    bl fib
    1: b 1b

.global fib
fib:
    push {r4-r6, lr}
    cmp r0, #1
    ble base
    mov r4, #0  // a = fib(0)
    mov r5, #1  // b = fib(1)
loop:
    subs r0, r0, #1
    beq done
    add r6, r4, r5
    mov r4, r5
    mov r5, r6
    b loop

done:
    mov r0, r5
    pop {r4-r6, lr}
    bx lr
base:
    pop {r4-r6, lr}
    bx lr
