// Jacob Panov

// This program declares data in memory such that the result
// of the program is r5 = r2, and r2, r3, and r4 are different.

.data
Data:
    .word A - 0x1 // Data points to A

A:
    .word B - 0x2 // A points to B

B:
    .word Data // B points to Data


.text
.global _start
_start:
	ldr r2, =Data
	ldr r3, [r2]
	ldr r4, [r3, #1]
	ldr r5, [r4, #2]
    1: b 1b    // Done