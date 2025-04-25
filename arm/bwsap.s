// Jacob Panov

// This program reverses the byte ordering in a 32-bit word.

.global _start
_start:
    ldr r0, =0x11223344
    bl bswap
    b _start        // End of testing code

bswap:
    rev r0, r0  // Reverse the byte order
    bx lr       // Return to the caller  
	
