// Jacob Panov

// Convert number 0-15 to BCD representation.

.global _start
_start:
    ldr r0, =10
    bl bcd
    b _start

// Convert a number to BCD
bcd:
    cmp r0, #10
    movlt r1, #0
    movge r1, #1
    subge r0, r0, #10
    orr r0, r0, r1, lsl #4
    bx lr
