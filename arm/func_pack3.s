// Jacob Panov

// pack3 packs three bytes into a 32-bit word as
// (a << 16) | (b << 8) | c.

.global _start
_start:
    mov r0, #0x12
    mov r1, #0x34
    mov r2, #0x56
    bl pack3
    1: b 1b

.global pack3
pack3:
    // r0=a, r1=b, r2=c
    lsl r0, r0, #16
    orr r0, r0, r1, lsl #8
    orr r0, r0, r2
    bx lr
