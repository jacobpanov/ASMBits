// Jacob Panov
//
// Write a function named func that does nothing and simply returns.
.global _start
_start:
    call  func   # Call your function
    1: br 1b     # Infinite loop to stop program after testing

func:
    ret
