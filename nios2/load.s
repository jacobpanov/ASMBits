// Jacob Panov
//
// Read the 32-bit word located at 0x345678 and return it.
.global _start
_start:
    movia sp, 0x04000000
    movia r2, 0x345678
    movia r3, 123
    stw r3, 0(r2)
    movi r2, 0xbad   # This function has no parameters.
    movi r3, 0xbad   # So destroy register values here so you won't be tempted to use it.
    call load
    1: br 1b    # Done

.global load
load:
    movhi r2, 0x34           # r2 = 0x34_0000
    ori   r2, r2, 0x5678     # r2 = 0x34_5678
    ldw   r2, 0(r2)          # load word from [0x345678] into r2
    ret
