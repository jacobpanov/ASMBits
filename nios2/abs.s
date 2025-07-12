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
    # Implement absolute value here.
