// Jacob Panov

// Return the first instruction word of the function MyFunc.

// Some testing code
// Make sure to submit without "MyFunc" defined in your code, or you will get a "multiple definition" error.
// MyFunc: ret

.global _start
_start:
    bl get_opcode
    1: b 1b  // done

// Your function starts here:
get_opcode:
    ldr r1, =MyFunc   // Load address of MyFunc
    ldr r0, [r1]      // Load first instruction word
    bx lr             // Return to caller

