// Jacob Panov
//
// Swap the elements at indexes r5 and r6 of the array pointed to by r4.
Data: .word 0x123, 0x124, 0x125
.global _start
_start:
    movia r4, Data
    movi r5, 0
    movi r6, 2
    call swap
    1: br 1b    # Done

# Swap two array elements
swap:
    # Implement swap here.
