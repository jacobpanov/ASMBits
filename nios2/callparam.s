// Jacob Panov
//
// Demonstrates passing parameters to a function.
// call1234 tail-calls `secret` with the arguments 1, 2, 3 and 4.
.global _start
_start:
    movia sp, 0x04000000
    call call1234
    1: br 1b

not_secret:  # For debugging, call this instead of secret.
             # Call "secret" when submitting or you'll get wrong answer!
    movi r2, 1
    ret

.global call1234
call1234:
    movi r4, 1      # First argument
    movi r5, 2      # Second argument
    movi r6, 3      # Third argument
    movi r7, 4      # Fourth argument
    movia r8, secret # Address of secret
    jmp r8          # Tail call
