// Jacob Panov

// Determine if a memory address is enabled by the chip select lines.

.global _start
_start:
        ldr r0, =0xff3100
        bl memenable
1:      b 1b    // Done

memenable:
    lsr r1, r0, #12        // Check upper 20 bits
    ldr r2, =0xff3
    cmp r1, r2
    moveq r0, #1
    movne r0, #0
    bx lr
