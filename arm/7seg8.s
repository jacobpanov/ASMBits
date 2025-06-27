// Jacob Panov

// Display 32-bit number on 8 seven-seg digits.

.global _start
_start:
    ldr r0, =8
    bl hexdisplay
    1: b 1b

.global hexdisplay
hexdisplay:
    push {r4-r7, lr}
    adr r2, SegTable
    mov r4, r0          // save input
    mov r5, #0          // low 32 bits result
    mov r6, #0          // high 32 bits result
    mov r7, #0          // shift amount

    // lower four digits
1:
    and r3, r4, #0xf
    ldrb r3, [r2, r3]
    orr r5, r5, r3, lsl r7
    lsr r4, r4, #4
    add r7, r7, #8
    cmp r7, #32
    bne 1b

    // upper four digits
    mov r7, #0
    mov r4, r0, lsr #16
2:
    and r3, r4, #0xf
    ldrb r3, [r2, r3]
    orr r6, r6, r3, lsl r7
    lsr r4, r4, #4
    add r7, r7, #8
    cmp r7, #32
    bne 2b

    mov r0, r5
    mov r1, r6
    pop {r4-r7, lr}
    bx lr

SegTable:
    .byte 0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07
    .byte 0x7f,0x6f,0x77,0x7c,0x58,0x5e,0x79,0x71
