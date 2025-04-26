// Jacob Panov

// This program uses .equ to declare a constant named LEDS with a value 0xff200000.
// Then called function get_led that returns the value of LEDs in r0.

.equ LEDS, 0xff200000
.global get_led
// A function that returns the value of LEDS
get_led:
    ldr r0, =LEDS
    bx lr