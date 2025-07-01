// Jacob Panov

// Count hits and misses with repeated accesses to the same block.

.data
// This direct-mapped cache has 4 sets/blocks. Their tags are 0, 0x100, 0xc0, and 0x40
// for set 0, 1, 2, and 3, respectively.
CacheTags:
.word 0
.word 0x100
.word 0xc0
.word 0x40

AddressList:
.word 0x120     // This is a miss (set 2)
.word 0x120     // This is a hit (set 2)
.word 0x122     // This is also hit to the same block (set 2)
.word 0x220     // This is a miss (set 2)
.word -1

.text
.global _start
_start:
        ldr sp, =0x4000000      // This problem will probably use the stack
        ldr r0, =4      // Cache has 2^4 byte blocks
        ldr r1, =2      // Cache has 2^2 sets
        ldr r2, =CacheTags
        ldr r3, =AddressList
        bl cachehits

@@ -5,27 +5,89 @@
.data
// This direct-mapped cache has 4 sets/blocks. Their tags are 0, 0x100, 0xc0, and 0x40
// for set 0, 1, 2, and 3, respectively.
CacheTags:
.word 0
.word 0x100
.word 0xc0
.word 0x40

AddressList:
.word 0x120     // This is a miss (set 2)
.word 0x120     // This is a hit (set 2)
.word 0x122     // This is also hit to the same block (set 2)
.word 0x220     // This is a miss (set 2)
.word -1

.text
.global _start
_start:
        ldr sp, =0x4000000      // This problem will probably use the stack
        ldr r0, =4      // Cache has 2^4 byte blocks
        ldr r1, =2      // Cache has 2^2 sets
        ldr r2, =CacheTags
        ldr r3, =AddressList
        bl cachehits
1:      b 1b    // Done

cachehits:
        // r0 = B, r1 = S, r2 = cachetags, r3 = addrlist
        push   {r4-r11, lr}
        mov    r4, r0            // Save B
        mov    r5, r1            // Save S
        mov    r6, r2            // Cache tag array
        mov    r7, r3            // Address list pointer
        mov    r8, #0            // Hit count

        // Compute mask for set index: (1 << S) - 1
        mov    r9, #1
        lsl    r9, r9, r5
        sub    r9, r9, #1

        // Precompute shift amount for tag bits
        add    r10, r4, r5       // r10 = B + S

        // Mask for offset+set bits, used when updating cache
        // Need special case when B+S >= 32 to avoid undefined shifts
        cmp    r10, #32
        movcs  r11, #-1          // All bits if shift >= 32
        movcc  r11, #1
        lslcc  r11, r11, r10
        subcc  r11, r11, #1

1:      ldr    r0, [r7], #4      // Load next address
        cmp    r0, #-1
        beq    2f

        // Compute set index
        mov    r1, r0
        lsr    r1, r1, r4
        and    r1, r1, r9

        // Compute tag from address
        mov    r2, r0
        cmp    r10, #32
        lsrcc  r2, r2, r10
        movcs  r2, #0

        // Load tag from cache and extract tag bits
        ldr    r3, [r6, r1, LSL #2]
        cmp    r10, #32
        lsrcc  r3, r3, r10
        movcs  r3, #0

        cmp    r2, r3
        addeq  r8, r8, #1        // Hit
        bne    miss
        b      1b

miss:
        // Update cache with new tag value (preserve tag position)
        cmp    r10, #32
        movcs  r3, #0
        biccc  r3, r0, r11       // Clear offset+set bits when shift < 32
        str    r3, [r6, r1, LSL #2]
        b      1b

2:      mov    r0, r8            // Return hit count
        pop    {r4-r11, lr}
        bx     lr
