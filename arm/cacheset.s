// Jacob Panov

// Return the set index for an address using block and set sizes.

.global _start
_start:
        ldr r0, =0
        ldr r1, =2
        bl cacheset
1:      b 1b    // Done

cacheset:
