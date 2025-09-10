// Jacob Panov
//
// This program returns whether its parameter is odd.
.global _start
_start:
    movia r4, 1    # First function parameter is always passed through r4.
    call odd       # Return value is always in r2.
    1: br 1b    # Done

.global odd
odd:
    andi r2, r4, 1    # r2 = r4 & 1
    ret
