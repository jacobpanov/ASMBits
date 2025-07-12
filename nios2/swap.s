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
    # Calculate the address of the first element: r4 + r5 * 4
    slli    r7, r5, 2      # r7 = r5 * 4 (offset for index1)
    add     r7, r4, r7     # r7 = pointer + offset (address of element 1)

    # Calculate the address of the second element: r4 + r6 * 4
    slli    r8, r6, 2      # r8 = r6 * 4 (offset for index2)
    add     r8, r4, r8     # r8 = pointer + offset (address of element 2)

    # Swap the values at these addresses
    ldw     r9, 0(r7)      # r9 = *element1
    ldw     r10, 0(r8)     # r10 = *element2

    stw     r10, 0(r7)     # *element1 = *element2
    stw     r9, 0(r8)      # *element2 = *element1

    ret
