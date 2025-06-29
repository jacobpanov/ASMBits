// Jacob Panov

// Determine the cache block index for an address.

.global _start
_start:
        ldr r0, =0
        ldr r1, =2
        bl cacheblock
1:      b 1b    // Done

cacheblock:
