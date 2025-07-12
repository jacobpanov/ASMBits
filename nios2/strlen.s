// Jacob Panov
//
// Determine the length of a null-terminated string.
.data
MyString: .string "Hello World"

.text
.global _start
_start:
    movia r4, MyString
    call strlen
    1: br 1b

.global strlen
strlen:
    # Implement strlen here.
