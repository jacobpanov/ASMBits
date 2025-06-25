// Jacob Panov

// Iterative Fibonacci calculation.

.global _start
_start:
    mov r0, #4
    bl fib
    1: b 1b

.global fib
fib:
    push {r4-r7, lr}
    cmp r0, #1
    bls fib_base
    mov r4, #1          // fib(0)
    mov r5, #1          // fib(1)
    mov r6, #2          // current index

loop:
    cmp r6, r0          // reached n?
    bhi fib_done
    adds r7, r4, r5     // next = prev + curr
    bcs fib_overflow
    mov r4, r5
    mov r5, r7
    add r6, r6, #1
    b loop

fib_done:
    mov r0, r5
    b fib_exit

fib_overflow:
    mov r0, #0
    b fib_exit

fib_base:
    mov r0, #1

fib_exit:
    pop {r4-r7, lr}
    bx lr
