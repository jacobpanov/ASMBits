// Jacob Panov
//
// This program returns the bitwise inversion of its parameter.
.global _start
_start:
    movia r4, 1    # First function parameter is always passed through r4.
    call invert    # Return value is always in r2.
    1: br 1b    # Done

.global invert
invert:
	  nor r2, r4, r0
    ret
