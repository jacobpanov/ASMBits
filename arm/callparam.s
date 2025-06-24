// Jacob Panov

// Demonstrates passing parameters to a function.
// call1234 calls the function `secret` with the four
// arguments 1, 2, 3 and 4 and returns its result.

.global _start
_start:
    bl call1234
    1: b 1b

.global call1234
call1234:
    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    b secret
