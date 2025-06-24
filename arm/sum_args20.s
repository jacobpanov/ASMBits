// Jacob Panov

// sum computes the sum of exactly 20 integer arguments.
// Prototype: int sum(int n1, int n2, ..., int n20);

.global _start
_start:
    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    // push remaining 16 numbers onto the stack (values 5..20)
    mov r4, #20
    mov r5, #16
1:
    push {r4}
    sub r4, r4, #1
    subs r5, r5, #1
    bne 1b
    bl sum
    add sp, sp, #64      // clean 16 params
    1: b 1b

.text
.global sum
sum:
    push {r4-r7, lr}
    // save register params to stack
    push {r0-r3}
    mov r4, sp           // pointer to all 20 params
    mov r5, #20
    mov r0, #0
1:
    ldr r6, [r4], #4
    add r0, r0, r6
    subs r5, r5, #1
    bne 1b
    add sp, sp, #16      // drop saved regs
    pop {r4-r7, lr}
    bx lr
