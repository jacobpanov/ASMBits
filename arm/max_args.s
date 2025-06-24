// Jacob Panov

// Returns the maximum value in an array.

.data
Vals: .word 3,1,5,2,4

.text
.global _start
_start:
    ldr r0, =Vals
    mov r1, #5
    bl max_args
    1: b 1b

.global max_args
max_args:
    push {r4, lr}
    ldr r4, [r0], #4
    subs r1, r1, #1
loop:
    cmp r1, #0
    beq done
    ldr r2, [r0], #4
    cmp r2, r4
    movgt r4, r2
    subs r1, r1, #1
    bne loop

done:
    mov r0, r4
    pop {r4, lr}
    bx lr
