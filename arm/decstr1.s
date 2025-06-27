// Jacob Panov

// Convert unsigned decimal string to integer.

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
    mov r0, #0    // result
1:
    ldrb r2, [r1], #1
    cmp r2, #0
    beq done
    sub r2, r2, #'0'
    mov r3, r0, lsl #3
    add r3, r3, r0, lsl #1
    add r0, r3, r2
    b 1b
done:
    bx lr
