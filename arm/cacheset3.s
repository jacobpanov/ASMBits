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

        // Compute set mask: (1 << S) - 1
        push {r4-r7, lr}
        mov   r4, #1
        lsl   r4, r4, r0         // r4 = 1 << S
        sub   r4, r4, #1         // r4 = (1 << S) - 1

        // Compute set index for addr1 and addr2
        mov   r5, r2
        lsr   r5, r5, r1
        and   r5, r5, r4         // r5 = set index addr1

        mov   r6, r3
        lsr   r6, r6, r1
        and   r6, r6, r4         // r6 = set index addr2

        cmp   r5, r6
        bne   not_evict          // If set indices differ, cannot evict

        // Compute tag for addr1 and addr2: address >> (S+B)
        add   r7, r0, r1         // r7 = S + B

        mov   r5, r2
        lsr   r5, r5, r7         // r5 = tag addr1

        mov   r6, r3
        lsr   r6, r6, r7         // r6 = tag addr2

        cmp   r5, r6
        moveq r0, #0             // Same tag: cannot evict
        movne r0, #1             // Different tag: can evict
        bx    lr

not_evict:
        mov   r0, #0
        pop {r4-r7, lr}
        bx    lr
	