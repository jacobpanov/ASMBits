// Jacob Panov

// Sum elements of array.

.data
Array: .word 1, 2, 3

.text
.global _start
_start:
    ldr r0, =Array
    ldr r1, =3
    bl arraysum
    b _start

// Sum elements of array
arraysum:
    mov r2, #0
1:
    ldr r3, [r0], #4
    add r2, r2, r3
    subs r1, r1, #1
    bne 1b
    mov r0, r2
    bx lr
