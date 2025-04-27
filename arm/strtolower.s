// Jacob Panov

// This program changes every upper-case character (A-Z) in a string to lower-case (a-z).

.global strtolower
strtolower:
    ldrb r1, [r0], #1       // Load the next byte from the string into r1 and increment r0
    cmp r1, #0              // Check if the byte is the null terminator
    beq strtolower_done     // If null terminator, exit the loop

    cmp r1, #'A'            // Check if the character is >= 'A'
    blt strtolower     // If less than 'A', skip to the next character
    cmp r1, #'Z'            // Check if the character is <= 'Z'
    bgt strtolower     // If greater than 'Z', skip to the next character

    add r1, r1, #('a' - 'A') // Convert upper-case to lower-case by adding the offset
    strb r1, [r0, #-1]      // Store the converted character back to the string

    b strtolower       // Repeat the loop

strtolower_done:
    bx lr                   // Return to the caller