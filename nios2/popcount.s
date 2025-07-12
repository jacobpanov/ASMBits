// Jacob Panov
//
// Count the number of set bits in the input value.
.global _start
_start:
    movia r4, 5
    call popcount
    1: br 1b    # Done

# Only your function (starting at popcount) is judged.
popcount:
    mov     r2, r4             # r2 = n

    # r3 = (r2 >> 1)
    srli    r3, r2, 1
    # r5 = 0x55555555
    movi    r5, 0x5555
    orhi    r5, r5, 0x5555
    and     r3, r3, r5
    sub     r2, r2, r3

    # r5 = 0x33333333
    movi    r5, 0x3333
    orhi    r5, r5, 0x3333
    and     r3, r2, r5
    srli    r6, r2, 2
    and     r6, r6, r5
    add     r2, r3, r6

    # r5 = 0x0f0f0f0f
    movi    r5, 0x0f0f
    orhi    r5, r5, 0x0f0f
    srli    r3, r2, 4
    add     r2, r2, r3
    and     r2, r2, r5

    # r3 = (r2 >> 8)
    srli    r3, r2, 8
    add     r2, r2, r3

    # r3 = (r2 >> 16)
    srli    r3, r2, 16
    add     r2, r2, r3

    # r5 = 0x3f
    movi    r5, 0x3f
    and     r2, r2, r5

    ret
