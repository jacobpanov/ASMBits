// Jacob Panov

// This program writes new data into an element of a Codes array.
// Each Codes struct stores a 7-character postal_code string and a 2-byte area_code.

.data
List:
        .string "M5S3G4"
        .align 1
        .hword 416
        .string "V6T1Z4"
        .align 1
        .hword 604
        .string "K7L3N6"
        .align 1
        .hword 613
.align 2
PCode:  .string "N2L3G1"

.text
.global _start
_start:
        ldr r0, =List
        mov r1, #1
        ldr r2, =PCode
        ldr r3, =519
        bl set_data
        1: b 1b

.global set_data
set_data:
        // r0 = array base, r1 = index, r2 = postcode pointer, r3 = area code
        push {r4, r5, lr}
        lsl r4, r1, #3          // r4 = index*8
        add r4, r4, r1, LSL #1 // r4 += index*2 -> index*10
        add r0, r0, r4         // r0 = pointer to struct
        mov r4, r0             // r4 = destination for string

copy_loop:
        ldrb r5, [r2], #1
        strb r5, [r4], #1
        cmp r5, #0
        bne copy_loop

        // store area code (offset 8 from struct start)
        strh r3, [r0, #8]
        pop {r4, r5, lr}
        bx lr
