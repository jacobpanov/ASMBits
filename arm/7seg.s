// Jacob Panov

// Return segment pattern for a single hex digit.

.global _start
_start:
    ldr r0, =8
    bl sevenseg
    1: b 1b

.global sevenseg
sevenseg:
    cmp r0, #15
    bhi invalid
    adr r1, SegTable
    ldrb r0, [r1, r0]
    bx lr
invalid:
    mov r0, #0
    bx lr

SegTable:
    .byte 0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07
    .byte 0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71
