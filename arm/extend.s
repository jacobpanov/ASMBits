// Jacob Panov

// This function will extend a number to 32 bits and return the extended number (in r0).
// The first function parameter in r0 specifies which operation to do while the second holds
// the number to be extended
// r0 = 0 -> Zero extend 8-bit to 32-bit
// r0 = 1 -> Zero extend 16-bit to 32-bit
// r0 = 2 -> Sign extend 8-bit to 32-bit
// r0 = 3 -> Sign extend 16-bit to 32-bit

.global _start
_start:
    ldr r0, =2       // 2 = sign extend 8->32
    ldr r1, =0xf0    // The number to extend
    bl extend
    b _start         // End of testing code

extend:
    cmp r0, #0          // Check if r0 == 0 (zero extend 8-bit)
    beq zero8

    cmp r0, #1          // Check if r0 == 1 (zero extend 16-bit)
    beq zero16

    cmp r0, #2          // Check if r0 == 2 (sign extend 8-bit)
    beq sign8

    cmp r0, #3          // Check if r0 == 3 (sign extend 16-bit)
    beq sign16

    bx lr               // Return if no valid operation

zero8:
    and r0, r1, #0xFF   // Mask the upper 24 bits (zero extend 8-bit)
    bx lr

zero16:
    ldr r2, =0xFFFF     // Load 0xFFFF into r2
    and r0, r1, r2      // Mask the upper 16 bits (zero extend 16-bit)
    bx lr

sign8:
    and r0, r1, #0xFF   // Mask the upper 24 bits
    lsl r0, r0, #24     // Shift left to move the sign bit to the MSB
    asr r0, r0, #24     // Arithmetic shift right to sign-extend
    bx lr

sign16:
    ldr r2, =0xFFFF     // Load 0xFFFF into r2
    and r0, r1, r2      // Mask the upper 16 bits
    lsl r0, r0, #16     // Shift left to move the sign bit to the MSB
    asr r0, r0, #16     // Arithmetic shift right to sign-extend
    bx lr