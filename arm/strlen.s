// Jacob Panov

// This program returns the length of a null-terminated string.

.data
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString   // Load the address of the string into r0
    bl strlen           // Call the strlen function
    1: b 1b             // Infinite loop (done)

.global strlen
strlen:
    mov r1, r0          // Copy the starting address of the string into r1

strlen_loop:
    ldrb r2, [r0], #1   // Load the next byte from the string into r2 and increment r0
    cmp r2, #0          // Compare the byte with 0 (null terminator)
    bne strlen_loop     // If not null, continue the loop

    sub r0, r0, r1      // Subtract the starting address from the null terminator address
    sub r0, r0, #1      // Adjust for the final increment of r0
    bx lr               // Return the length in r0