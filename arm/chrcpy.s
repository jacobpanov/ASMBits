// Jacob Panov

// This program will copy one character from a string to another.

.data
Src: .string "hello"
.align 2   // Inserting padding so it's easier to read.
Dst: .string "bye"

.text
.global _start
_start:
    ldr r0, =Src       // Load the address of the source string into r0
    ldr r1, =1         // Index of the character to copy from the source
    ldr r2, =Dst       // Load the address of the destination string into r2
    ldr r3, =1         // Index of the character to copy to in the destination
    bl chrcpy          // Call the chrcpy function
    1: b 1b            // Done

chrcpy:
    push {r4}   // Save callee-saved registers
    add r0, r0, r1     // Calculate the address of Src[r1] (r0 = Src + r1)
    ldrb r4, [r0]      // Load the byte (character) from Src[r1] into r4
    add r2, r2, r3     // Calculate the address of Dst[r3] (r2 = Dst + r3)
    strb r4, [r2]      // Store the byte (character) into Dst[r3]
    pop {r4}           // Restore callee-saved registers
    bx lr              // Return to the caller

