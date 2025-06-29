// Jacob Panov

// Read a line from the UART until a newline character is received.
// Replace the newline with a null terminator and return the string length.

.data
Out: .skip 256  // Reserve space for output

.text
//read_uart:    // This may be useful for debugging
        ldr r0, =0xff201000
        ldr r0, [r0]
        bx lr

.global _start
_start:
        ldr sp, =0x04000000     // Initialize SP for debugging.
        ldr r0, =Out            // Use Out as the output string
        bl uartgets
1:      b 1b                    // Done


uartgets:
