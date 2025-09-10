// Jacob Panov
//
// This function returns the sum of its two parameters.

.global _start
_start:
    movi r4, 1  # First function parameter is always passed through r4.
    movi r5, 1  # Second function parameter is always passed through r5.
    call add    # Return value is always in r2.
    1: br 1b    # Done

.global add
add:
    add r2, r4, r5    # r2 = r4 + r5
    ret
