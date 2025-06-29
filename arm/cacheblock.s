// Jacob Panov

// Determine the cache block index for an address.

.global _start
_start:
        ldr r0, =0
        ldr r1, =2
        bl cacheblock
1:      b 1b    // Done

cacheblock:
        // r0 = addr1, r1 = addr2
        mov r2, r0, lsr #4     // r2 = addr1 >> 4
        mov r3, r1, lsr #4     // r3 = addr2 >> 4
        cmp r2, r3
        moveq r0, #1           // If equal, return 1
        movne r0, #0           // Else, return 0
        bx lr
