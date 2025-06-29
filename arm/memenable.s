// Jacob Panov

// Determine if a memory address is enabled by the chip select lines.

.global _start
_start:
        ldr r0, =0xff3100
        bl memenable
1:      b 1b    // Done

memenable:
