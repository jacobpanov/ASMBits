// Jacob Panov

// This program determines whether its parameter is odd, then calls
// odd or even, respectively.

.global _start
_start:
	ldr r0, =1    // First function parameter is always passed through r0.
	bl oddeven
	1: b 1b    // Done

oddeven:
	// Because there are nested function calls, lr needs to be saved and restored.
	push {lr}

  ands r0, r0, #0x1 // Check if r0 is odd or even.
  blne odd          // If r0 is odd, call odd.
  bleq even         // If r0 is even, call even.

	// Restore lr and return. (This can be shortened to pop {pc} )
	pop {lr}
	bx lr
