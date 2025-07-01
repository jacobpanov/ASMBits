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
        // r0 = C (bytes), r1 = W, r2 = addr1, r3 = addr2

        sub     r0, #1              // r0 = C-1
        clz     r0, r0              // r0 = clz(C-1)
        add     r0, r1              // r0 = clz(C-1) + W
        mov     r1, #32
        sub     r1, r0              // r1 = 32 - (clz(C-1) + W)

        eor     r2, r2, r3          // r2 = addr1 ^ addr2
        lsrs    r2, r2, r1          // shift out offset/set bits

        moveq   r0, #1
        movne   r0, #0
        bx      lr
        // Compute tag for addr2
        mov     r2, r3
        lsr     r2, r2, r0

        // Compare tags
        cmp     r1, r2
        moveq   r0, #1
        movne   r0, #0
        bx      lr
