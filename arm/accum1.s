// Jacob Panov

// Simple accumulator calculator.

.data
Cmd: .string "+0+@-P"

.text
.global _start
_start:
    ldr r0, =Cmd
    bl calc
    1: b 1b

.global calc
calc:
    mov r1, r0    // command pointer
    mov r0, #0    // accumulator
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
done:
    bx lr
