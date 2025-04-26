// Jacob Panov

// This program declares data in memory such that the result
// of the program is r3 = 0x12345, and r0, r1, and r2 are different.

.data
Data:
    .word Data + 4
    .word Data + 8
    .word 0x12345

.text
.global _start
_start:
	ldr r0, =Data
	ldr r1, [r0]
	ldr r2, [r1]
	ldr r3, [r2]
    1: b 1b    // Done