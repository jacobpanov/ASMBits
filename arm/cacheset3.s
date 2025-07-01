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
        // r0 = S, r1 = B, r2 = addr1, r3 = addr2

        eor     r2, r2, r3        // r2 = addr1 ^ addr2
        lsr     r2, r2, r1        // remove block offset bits

        mov     r1, #32
        sub     r1, r0            // r1 = 32 - S

        lsls    r3, r2, r1        // check if set bits are all zero
        bne     exit0
        lsrs    r3, r2, r0        // check if tag bits differ
        beq     exit0

        mov     r0, #1            // can evict
        bx      lr

exit0:
        mov     r0, #0
        bx      lr
