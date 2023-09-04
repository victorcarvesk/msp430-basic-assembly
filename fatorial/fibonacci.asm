#include <msp430.h>
    NAME main
    PUBLIC main
    RSEG CSTACK
    RSEG    CODE
    
    
main:       MOV.W #WDTPW+WDTHOLD, &WDTCTL        ; stop watchdog timer
            MOV.B #0x01, P1DIR                   ; configura led como sa�da
            MOV.B #0x01, P1OUT                   ; configura��o da sa�da em 1

start:
            MOV R4, 5                       ; first index of fibonacci
            MOV R5, 8                       ; second index of fibonacci
            MOV R6, 1                       ; first number of sum
            MOV R7, 1                       ; second number of sum

fibone:     DEC R4                          ; calc fib
            ADD R6, R7
            MOV R7, R6
            JNZ fibone
            MOV R4, R7

reset_var:                                  ; reset the fib sum numbers
            MOV R6, 1
            MOV R7, 1

fibtwo:     DEC R5                          : calc fib
            ADD R6, R7
            MOV R7, R6
            JNZ fibtwo
            MOV R5, R7

diference:
            SUB R5, R4

            end 
