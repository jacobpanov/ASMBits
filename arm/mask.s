// Jacob Panov

// This program will return a 32-bit number where the lowest N bits are
// set to 1 and the rest are set to 0. 

.global _start
_start:
	ldr r0, =4
	bl mask
1:	b 1b    // Done

mask:
  mov r1, #1     // Initialize r1 to 1
  lsl r1, r1, r0 // Shift left by r0 bits
  sub r0, r1, #1 // Subtract 1 to set the lowest N bits to 1
  bx lr          // Return to the caller
	