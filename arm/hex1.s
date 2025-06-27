// Jacob Panov

// Convert a single hex digit (0..15) to ASCII.

.global _start
_start:
    ldr r0, =0xa
    bl hex1
    b _start

// Print one hex digit
hex1:
    cmp r0, #9
    ble digit
    add r0, r0, #'a' - 10
    bx lr
digit:
    add r0, r0, #'0'
    bx lr
