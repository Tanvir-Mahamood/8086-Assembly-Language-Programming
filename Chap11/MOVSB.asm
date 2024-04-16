.MODEL SMALL
.STACK 100H
.DATA
    STR1 DB 'HELLO $'
    STR2 DB 7 DUP(?) '$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
    MOV ES, AX
    
    LEA SI, STR1
    LEA DI, STR2
    
    CLD
    
    MOV CX, 10
    REP MOVSB
    
    LEA DX, STR2
    MOV AH, 9
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN