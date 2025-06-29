// Jacob Panov

// Return the set index for an address using block and set sizes.

.global _start
_start:
        ldr r0, =0
        ldr r1, =2
        bl cacheset
1:      b 1b    // Done

cacheset:
        // r0 = addr1, r1 = addr2
        mov r2, r0, lsr #4         // r2 = addr1 >> 4
        mov r3, r1, lsr #4         // r3 = addr2 >> 4
        and r2, r2, #0xFF          // r2 = set index of addr1
        and r3, r3, #0xFF          // r3 = set index of addr2
        cmp r2, r3
        moveq r0, #1
        movne r0, #0
        bx lr
