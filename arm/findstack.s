// Jacob Panov

// Return the address of this function's stack frame.

.global _start
_start:
    ldr sp, =0x4000000
    bl where

    1: b 1b  // done

// Your function starts here:
where:

