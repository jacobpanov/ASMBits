// Jacob Panov

// This program declares the following 12 bytes:
// 01 02 03 04 05 06 07 08 09 0a 0b 0c
// This program also creates a label "Six" that points to the 6th byte.

.data
.org 0x1000 - 5       // Move the current location to 0x1000 bytes after the start of the .data section
Blob: .byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C
Six = Blob + 5 // Label "Six" points to the 6th byte

