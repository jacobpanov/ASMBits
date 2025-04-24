// Jacob Panov

// This program is a simple ARM assembly program that demonstrates
// how to set up a function and return from it.
// It includes a function that does nothing and returns to the caller.
// The program ends with an infinite loop to prevent it from exiting.

.global _start
_start:   
    bl  func   // Call your function
               // Your function should return here.
    1: b 1b    // Infinite loop to stop program after testing

func:
    bx lr // Return to the caller