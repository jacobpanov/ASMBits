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

cachehits:
