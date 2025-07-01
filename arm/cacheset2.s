// Jacob Panov

// Compute the cache set given address size parameters.

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

        // Compute set index for addr1 and addr2, compare
        mov     r12, r2
        lsr     r12, r12, r1      // r12 = addr1 >> B
        mov     r4, r3
        lsr     r4, r4, r1        // r4 = addr2 >> B

        mov     r5, #1
        lsl     r5, r5, r0        // r5 = 1 << S
        sub     r5, r5, #1        // r5 = (1 << S) - 1

        and     r12, r12, r5      // set index addr1
        and     r4, r4, r5        // set index addr2

        cmp     r12, r4
        moveq   r0, #1
        movne   r0, #0
        bx      lr
