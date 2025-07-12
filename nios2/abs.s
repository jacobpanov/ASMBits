// Jacob Panov
//
// This program returns the absolute value of its parameter.
.global _start
_start:
    movia r4, 10  # First function parameter is always passed through r4.
    call abs      # Return value is always in r2.
    1: br 1b    # Done

.global abs
abs:
    mov r2, r4           # Copy input to r2
    bge r4, zero, endabs # If r4 >= 0, skip negation
    sub r2, zero, r4     # r2 = -r4
endabs:
    ret
