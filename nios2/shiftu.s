// Jacob Panov
//
// This program converts one unsigned 32-bit sample to unsigned 8-bit format.

# A test case to test your function with

.global _start
_start:
    movia r4, 0x12345678
    call shift
    br _start        # End of testing code

# Convert one U32 sample to U8 format
shift:
    srli r2, r4, 24     # r2 = (r4 >> 24) & 0xFF
    ret
	
