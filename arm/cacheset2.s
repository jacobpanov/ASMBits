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

        // Compute set mask: (1 << S) - 1
        push {r4-r6, lr}
        mov r4, #1
        lsl r4, r4, r0        // r4 = 1 << S
        sub r4, r4, #1        // r4 = (1 << S) - 1

        // Compute set index for addr1: (addr1 >> B) & mask
        mov r5, r2
        lsr r5, r5, r1
        and r5, r5, r4

        // Compute set index for addr2: (addr2 >> B) & mask
        mov r6, r3
        lsr r6, r6, r1
        and r6, r6, r4

        cmp r5, r6
        moveq r0, #1
        movne r0, #0
        pop {r4-r6, lr}
        bx lr