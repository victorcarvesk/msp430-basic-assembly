#include <msp430.h>
    NAME    main
    PUBLIC  main
    RSEG    CSTACK
    RSEG    CODE
    
    
main:       MOV #WDTPW+WDTHOLD, &WDTCTL ; stop watchdog timer

start:
            MOV #5, R4 ; first index of fibonacci
            MOV #8, R5 ; second index of fibonacci
            
            MOV #1, R6 ; first number of sum
            MOV #1, R7 ; second number of sum
            BIC #0xFFFF, R8 ; clear R8 (not.src and dst -> dst)
            
            DEC R4
            DEC R4
            
fibonacci:  MOV R6, R8
            ADD R7, R8
            MOV R7, R6
            MOV R8, R7
            DEC R4                          ; calc fib
            JNZ fibonacci
            MOV R7, R4
            JMP reset_var

reset_var:                                  ; reset the fib sum numbers
            MOV.B #1, R6                       ; first number of sum
            MOV.B #1, R7

fibtwo:     MOV.B R7, R8
            MOV.B R6, R7
            ADD R7, R8
            MOV R7, R6
            MOV R8, R7
            DEC R4
            JNZ fibtwo
            MOV R7, R5

diference:
            SUB R5, R4

            end
