// Jacob Panov

// This program will return a 32-bit number where bits M (inclusive)
// to N (exclusive) are 1.

// N and M are between 0 and 32. N is guararnteed to be no smaller than M. 
// If N == M, then no bits are set to 1.

.global _start
_start:
	ldr r0, =4
	ldr r1, =2
	bl mask
1:	b 1b    // Done

mask:
  mov r2, #1          // r2 = 1
  lsl r2, r0          // r2 = 1 << N
  sub r2, r2, #1      // r2 = (1 << N) - 1 (all bits below N are 1)

  mov r3, #1          // r3 = 1
  lsl r3, r1          // r3 = 1 << M
  sub r3, r3, #1      // r3 = (1 << M) - 1 (all bits below M are 1)

  bic r0, r2, r3      // r0 = r2 & ~(r3) (clear bits below M)
  bx lr               // Return to the caller       