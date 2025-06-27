// Jacob Panov

// Parse signed decimal string.

.data
Str: .string "1234"

.text
.global _start
_start:
    ldr r0, =Str
    bl decstr
    b _start

.global decstr
decstr:
    mov r1, r0    // pointer
    ldrb r2, [r1], #1
    mov r3, #0    // negative flag
    cmp r2, #'-'
    bne first
    mov r3, #1
    ldrb r2, [r1], #1
first:
    mov r0, #0
loop:
    cmp r2, #0
    beq finish
    sub r2, r2, #'0'
    mov r4, r0, lsl #3
    add r4, r4, r0, lsl #1
    add r0, r4, r2
    ldrb r2, [r1], #1
    b loop
finish:
    cmp r3, #0
    beq done
    rsb r0, r0, #0
done:
    bx lr
