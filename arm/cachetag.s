// Jacob Panov

// Return the tag for an address using cache parameters.

.global _start
_start:
        ldr r0, =16384
        ldr r1, =2
        ldr r2, =0
        ldr r3, =2
        bl cachetag
1:      b 1b    // Done


cachetag:
