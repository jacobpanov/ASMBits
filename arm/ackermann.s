// Jacob Panov

// Computes the Ackermann function recursively.
// ackermann(m, n)

.global _start
_start:
    mov r0, #2
    mov r1, #2
    bl ackermann
    1: b 1b

.global ackermann
ackermann:
    push {r4-r5, lr}
    cmp r0, #0
    bne m_not_zero
    add r0, r1, #1
    pop {r4-r5, lr}
    bx lr
m_not_zero:
    cmp r1, #0
    bne rec_case
    sub r0, r0, #1
    mov r1, #1
    bl ackermann
    pop {r4-r5, lr}
    bx lr
rec_case:
    mov r4, r0
    mov r5, r1
    sub r1, r1, #1
    bl ackermann
    mov r1, r0
    sub r0, r4, #1
    bl ackermann
    pop {r4-r5, lr}
    bx lr
