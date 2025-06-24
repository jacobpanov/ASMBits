// Jacob Panov

// sum computes the sum of a variable number of integer arguments.
// Prototype: int sum(int n, ...);

.global _start
_start:
    mov r0, #3        // n
    mov r1, #1
    mov r2, #2
    mov r3, #3
    bl sum
    1: b 1b

.text
.global sum
sum:
    push {r4-r7, lr}
    mov r4, #0       // accumulator
    mov r5, r0       // count remaining
    // handle first three arguments in r1-r3
    cmp r5, #0
    beq done
    add r4, r4, r1
    subs r5, r5, #1
    beq done
    add r4, r4, r2
    subs r5, r5, #1
    beq done
    add r4, r4, r3
    subs r5, r5, #1
    beq done
    // remaining arguments on stack after pushes (5 regs *4 =20)
    add r6, sp, #20
1:
    ldr r7, [r6], #4
    add r4, r4, r7
    subs r5, r5, #1
    bne 1b

done:
    mov r0, r4
    pop {r4-r7, lr}
    bx lr
