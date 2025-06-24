// Jacob Panov

// Sums 20 integers stored in an array.

.data
Nums20:
    .word 1,2,3,4,5,6,7,8,9,10
    .word 11,12,13,14,15,16,17,18,19,20

.text
.global _start
_start:
    ldr r0, =Nums20
    mov r1, #20
    bl sum_args20
    1: b 1b

.global sum_args20
sum_args20:
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
