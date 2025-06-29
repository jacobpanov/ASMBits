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
        push {r1-r4, lr}           // Save registers we'll use
        mov r1, r0                 // r1 = output pointer
        mov r2, #0                 // r2 = length

uartgets_loop:
        bl read_uart               // r0 = UART status/char
        tst r0, #(1 << 15)         // Check if char valid (bit 15)
        beq uartgets_loop          // If not valid, poll again

        and r3, r0, #0xFF          // r3 = received char (bits 7:0)
        cmp r3, #0x0A              // Compare with '\n' (0x0A)
        beq uartgets_done
        cmp r3, #0x0D              // Compare with '\r' (0x0D)
        beq uartgets_done

        strb r3, [r1], #1          // Store char, increment pointer
        add r2, r2, #1             // Increment length
        b uartgets_loop

uartgets_done:
        mov r3, #0
        strb r3, [r1]              // Null-terminate string
        mov r0, r2                 // Return length in r0
        pop {r1-r4, pc}            // Restore regs and return
