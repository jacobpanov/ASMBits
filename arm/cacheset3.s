// Jacob Panov

// Another version of the cache set calculation problem.

.global _start
_start:
        ldr r0, =8
        ldr r1, =4
        ldr r2, =0
        ldr r3, =2
        bl cacheset
1:      b 1b    // Done

cacheset:
