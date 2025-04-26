// Jacob Panov

// This program declares data in memory such that the result is
// r1 = 0x1234, r2 = 0x5678, r3 = 0x90

.data
Data:
    .word 0                 // At offset #0, r0 = 0
    .word 0x00001234        // At offset #0, r1 = 0x1234
    .word 0x90005678        // At offset #4, r2 = 0x5678

.text
.global _start
_start:
    ldr r0, =Data       // Load the address of Data into r0
    ldr r1, [r0]        // Load the word at offset #0 into r1 (0x1234)
    ldr r2, [r0, #4]    // Load the word at offset #4 into r2 (0x5678)
    ldrb r3, [r0, #8]   // Load the byte at offset #8 into r3 (0x90)
    1: b 1b             // Done