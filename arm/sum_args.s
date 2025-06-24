// Jacob Panov

// sum_args sums an array of integers passed by pointer and count.

.data
Numbers: .word 1,2,3,4

.text
.global _start
_start:
    ldr r0, =Numbers
    mov r1, #4
    bl sum_args
    1: b 1b

.global sum_args
sum_args:
    // r0 = pointer, r1 = count
    push {r4, lr}
    mov r4, #0
loop:
    cmp r1, #0
    beq done
    ldr r2, [r0], #4
    add r4, r4, r2
    subs r1, r1, #1
    bne loop

done:
    mov r0, r4
    pop {r4, lr}
    bx lr
