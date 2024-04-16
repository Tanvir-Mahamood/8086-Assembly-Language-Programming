;1971
;2002
; sum = 3973
.MODEL SMALL
.STACK 100H
.DATA
    N DW ?  ;USED TO STORE INPUT VALUE 
    A DW ?
    F DB 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    ;INPUT CODE
    MOV N, 0
    MOV BX, 10        
    INPUT:             ;INPUR WILL BE STORED IN N
        MOV AH, 1
        INT 21H 
            
        CMP AL, 13
        JE NEXT        ;GO OUT OF INPUT LEVEL
        
        SUB AL, 30H
        MOV AH, 0      ;INPUT IN AX 
        MOV CX, AX
        MOV AX, N
        MUL BX
        
        ADD AX, CX
        MOV N, AX
        JMP INPUT
    
    NEXT: 
        mov ah, 2   ;newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        MOV AX, N
        CMP F, 1
        JE SUM
        
        ;MOV AX, N 
        MOV A, AX  
        MOV F, 1 ; FIRST INPUT DONE
        
        MOV N, 0
        MOV BL, 10
        JMP INPUT
    
    SUM:
        ADD AX, A
        MOV N, AX
        
    
    ;OUTPUT CODE
    OUTPUT:            ;OUTPUT WHATEVER IN N
        MOV AX, N
        MOV DX, 0
        MOV BX, 10
        MOV CX, 0
    
        L1:            ;STACK INPUT
            DIV BX
;IN CASE OF 8  BIT REGISTER, AL = QUOTIENT, AH = REMAINDER
;IN CASE OF 16 BIT REGISTER, AX = QUOTIENT, DX = REMAINDER
            PUSH DX    ;SAVE IN STACK
            MOV DX, 0
            ;MOV AH, 0
            INC CX     ;SIZE OF STACK
            CMP AX, 0
            JNE L1
            MOV AH, 2
        L2:            ;STACK OUTPUT
            POP DX
            ADD DX, 48
            INT 21H
            LOOP L2
    
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN