// Jacob Panov

// This program return the peak-to-peak amplitude of a signal.
// The signal is stored in an array of 32-bit signed words.

Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl peak
    b _start        // End of testing code

peak: