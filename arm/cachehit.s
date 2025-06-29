// Jacob Panov

// Determine whether an address is present in a direct-mapped cache.

.data
# This direct-mapped cache has 4 sets/blocks. Their tags are 0, 0x100, 0xc0, and 0x40
# for set 0, 1, 2, and 3, respectively.
CacheTags:
.word 0
.word 0x100
.word 0xc0
.word 0x40

.text
.global _start
_start:
        ldr r0, =4      // Cache has 2^4 byte blocks
        ldr r1, =2      // Cache has 2^2 sets
        ldr r2, =CacheTags
        ldr r3, =0x110  // Is 0x110 in the cache?
        bl cachehit
1:      b 1b    // Done


cachehit:
        // r0 = B, r1 = S, r2 = cachetags, r3 = addr

        // Compute set index: (addr >> B) & ((1 << S) - 1)
        mov     r12, r3
        lsr     r12, r12, r0
        mov     r4, #1
        lsl     r4, r4, r1
        sub     r4, r4, #1
        and     r12, r12, r4      // r12 = set index

        // Compute tag: addr >> (B + S)
        add     r4, r0, r1
        mov     r5, r3
        lsr     r5, r5, r4        // r5 = tag

        // Load tag from cachetags[set index]
        lsl     r12, r12, #2      // offset = set index * 4
        ldr     r6, [r2, r12]     // r6 = cache tag

        // Compare tags
        cmp     r5, r6
        moveq   r0, #1
        movne   r0, #0
        bx      lr
