// Jacob Panov

// This program inserts a number into an array of 32-bit integers.
// Elements after the insertion index are shifted by one.

.data
// Leave some space for the expanded array
Array: .word 1, 2, 3, 4, 0xff, 0xff

.text
.global _start
_start:
    ldr r0, =Array
    ldr r1, =4      // length
    ldr r2, =2      // insert position
    ldr r3, =123    // number to insert
    bl array_insert
1:  b 1b            // Done

.global array_insert
array_insert:
    // r0 = array, r1 = length, r2 = index, r3 = value
    push {r4, r5, r6}        // Save callee-saved registers
    add r4, r0, r1, LSL #2   // pointer past last element
    mov r5, r1               // r5 = current index = length

shift_loop:
    cmp r5, r2
    ble store_value
    sub r4, r4, #4
    ldr r6, [r4]
    str r6, [r4, #4]
    subs r5, r5, #1
    b   shift_loop

store_value:
    str r3, [r0, r2, LSL #2]
    pop {r4, r5, r6}         // Restore registers
    bx lr

