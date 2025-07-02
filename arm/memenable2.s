// Jacob Panov

// Determine if a memory address range is enabled using multiple chip select lines.

.global _start
_start:
        ldr r0, =0xff3100
        bl memenable
1:      b 1b    // Done

memenable:
    mov r3, r0            // Preserve address
    lsr r1, r3, #12       // Check range 0xff3000-0xff3fff
    ldr r2, =0xff3
    cmp r1, r2
    mvnne r0, #0          // Return -1 if outside range
    lsreq r0, r3, #8      // Device index bits [11:8]
    andeq r0, r0, #0xf
    bx lr
