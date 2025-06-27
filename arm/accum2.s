// Jacob Panov

// Accumulator with conditional branches.

.data
Cmd:  .byte '+', 1, 'B', 1, '+', 2, '+', 3, 0
Cmd2: .byte '+', 1, 'b', 1, '+', 2, '+', 3, 0

.text
.global _start
_start:
    ldr r0, =Cmd
    bl calc
    1: b 1b

.global calc
calc:
    mov r1, r0
    mov r0, #0
loop:
    ldrb r2, [r1], #1
    cmp r2, #0
    beq done
    ldrsb r3, [r1], #1
    cmp r2, #'+'
    beq add
    cmp r2, #'-'
    beq sub
    cmp r2, #'*'
    beq mul
    cmp r2, #'b'
    beq bneg
    cmp r2, #'B'
    beq bpos
    b loop
add:
    add r0, r0, r3
    b loop
sub:
    sub r0, r0, r3
    b loop
mul:
    mul r2, r0, r3
    mov r0, r2
    b loop
bneg:
    cmp r0, #0
    bge loop
    mov r4, r3, lsl #1
    add r1, r1, r4
    b loop
bpos:
    cmp r0, #0
    blt loop
    mov r4, r3, lsl #1
    add r1, r1, r4
    b loop
done:
    bx lr
