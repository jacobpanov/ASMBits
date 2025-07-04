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
        push    {r4-r7}

        lsr     r4, r3, r0           // r4 = addr >> B
        mov     r5, #32
        sub     r5, r1               // r5 = 32 - S
        lsl     r4, r4, r5
        lsr     r4, r4, r5           // r4 = set index
        lsl     r4, r4, #2           // r4 = set index * 4

        ldr     r5, [r2, r4]         // r5 = tag from cachetags[set index]

        eor     r5, r3               // r5 = tag ^ addr
        lsr     r5, r5, r0           // remove block offset bits
        lsrs    r5, r5, r1           // remove set index bits

        moveq   r0, #1
        movne   r0, #0
        pop     {r4-r7}
        bx      lr
        cmp     r5, r6
        moveq   r0, #1
        movne   r0, #0
        bx      lr
