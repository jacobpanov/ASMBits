// Jacob Panov

// This program returns whether its parameter is a power of 2.

.global _start
_start:
	ldr r0, =4
	bl pow2
1:	b 1b    // Done

pow2:
  cmp r0, #0          // Check if the input is 0
  beq not_pow2        // If 0, it's not a power of 2

  sub r1, r0, #1      // r1 = r0 - 1
  and r1, r0, r1      // r1 = r0 & (r0 - 1)
  cmp r1, #0          // Check if the result is 0
  moveq r0, #1        // If zero, it's a power of 2 (return 1)
  movne r0, #0        // Otherwise, it's not a power of 2 (return 0)
  bx lr               // Return to the caller

not_pow2:
  mov r0, #0          // Return 0 if the input is 0
  bx lr               // Return to the caller
