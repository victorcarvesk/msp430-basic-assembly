#include "msp430.h"                     ; Inclui a biblioteca padrão do MSP430

        NAME    main                    ; Define o nome do módulo

        PUBLIC  main                    ; Torna o rótulo "main" visível fora deste módulo

        RSEG    CSTACK                  ; Define o segmento CSTACK para a pilha
        RSEG    CODE                    ; Define o segmento CODE para o código

main:   MOV.W   #WDTPW+WDTHOLD,&WDTCTL  ; Para o watchdog timer

        MOV #6, R4                      ; Inicializa R4 com o valor 6
        MOV #8, R5                      ; Inicializa R5 com o valor 8
            
        MOV #1, R6                      ; Inicializa R6 com o valor 1
        MOV #1, R7                      ; Inicializa R7 com o valor 1
        BIC #0xFFFF, R8                 ; Limpa R8

        BIT #0xFFFE, R4                 ; Verifica se o bit menos significativo de R4 é 1
        JZ reset                        ; Se for 1, pule para a etiqueta 'reset'
        DEC R4                          ; Decrementa R4
        BIT #0xFFFE, R4                 ; Verifica novamente o bit menos significativo de R4
        JZ reset                        ; Se for 1, pule para 'reset'
        DEC R4                          ; Decrementa R4 novamente
            
fib:    MOV R6, R8                      ; Move R6 para R8
        ADD R7, R8                      ; Soma R7 a R8
        MOV R7, R6                      ; Move R7 para R6
        MOV R8, R7                      ; Move R8 para R7
        DEC R4                          ; Decrementa R4
        JNZ fib                         ; Se R4 não for zero, volte para 'fib'
        MOV R7, R4                      ; Move R7 para R4
        JMP reset                       ; Salta para 'reset'

reset:  MOV.B #1, R6                    ; Inicializa R6 com 1 (byte)
        MOV.B #1, R7                    ; Inicializa R7 com 1 (byte)
        
        BIT #0xFFFE, R5                 ; Verifica se o bit menos significativo de R5 é 1
        JZ reset                        ; Se for 1, pule para 'reset'
        DEC R5                          ; Decrementa R5
        BIT #0xFFFE, R5                 ; Verifica novamente o bit menos significativo de R5
        JZ diff                         ; Se for 1, pule para 'diff'
        DEC R5                          ; Decrementa R5 novamente
            
fibtwo: MOV R6, R8                      ; Move R6 para R8
        ADD R7, R8                      ; Soma R7 a R8
        MOV R7, R6                      ; Move R7 para R6
        MOV R8, R7                      ; Move R8 para R7
        DEC R5                          ; Decrementa R5
        JNZ fibtwo                      ; Se R5 não for zero, volte para 'fibtwo'
        MOV R7, R5                      ; Move R7 para R5

diff:   MOV R5, R9                      ; Move R5 para R9
        BIC #1, SR                      ; Limpa a flag C do registrador de status (SR)
        DADD R4, R9                     ; Adiciona R4 a R9 em decimal
        SUB R4, R9                      ; Subtrai R4 de R9

END                                     ; Fim do programa
