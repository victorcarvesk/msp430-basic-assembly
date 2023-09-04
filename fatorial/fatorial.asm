#include <msp430.h>
    NAME main
    PUBLIC main
    RSEG CSTACK
    RSEG    CODE
    
    
main:      MOV.W #WDTPW+WDTHOLD, &WDTCTL; stop watchdog timer
           MOV.B #0x01, P1DIR; configura led como saída
           MOV.B #0x01, P1OUT; configuração da saída em 1

mainloop:  XOR.B #0x01, P1OUT; comutando valor do LED
delay:     MOV #5, R8
return:    DEC R8; decrementar o R8 (em 1)
           JNZ return; enquanto nao for zero, permaneça 
           JMP mainloop            ; criação do laço infinitio
           end