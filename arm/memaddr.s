// Jacob Panov

// Calculate the required number of address lines for the given depth and width.

.global _start
_start:
        ldr r0, =16     // Depth 16
        ldr r1, =8      // 8 bit wide (128 bits of capacity)
        bl addrlines
1:      b 1b    // Done

addrlines:
    sub r2, r0, #1       // Depth - 1
    clz r2, r2           // Count leading zeros
    rsb r0, r2, #32      // 32 - leading zeros
    bx lr
