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
