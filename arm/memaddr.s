// Jacob Panov

// Calculate the required number of address lines for the given depth and width.

.global _start
_start:
        ldr r0, =16     // Depth 16
        ldr r1, =8      // 8 bit wide (128 bits of capacity)
        bl addrlines
1:      b 1b    // Done

addrlines:
