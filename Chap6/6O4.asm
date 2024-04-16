;6.4 IF(AX < 0)       BX = -1
;    ELSE IF(AX == 0) BX = 0
;    ELSE             BX = 1

.MODEL SMALL
.STACK 100H
.DATA
    MSZ1 DB 'Value in BX: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS,AX 
    
    MOV AX, -4   ;AX IS READY   
    
    CMP AX, 0
    JL  NEGATIVE ;NEGATIVE
    JE  ZERO     ;ZERO
    MOV BX, 1    ;POSITIVE 
    JMP PRINT
    
    NEGATIVE:
        MOV BX, -1
        JMP PRINT_NEG 
    ZERO:
        MOV BX, 0 
        JMP PRINT
    
    PRINT:
        MOV AH, 9  ;PRINTING ANSWER
        LEA DX, MSZ1
        INT 21H
    
        MOV DX, BX 
        ADD DX, 48
        MOV AH, 2
        INT 21H 
    PRINT_NEG:
        MOV AH, 9  ;PRINTING ANSWER
        LEA DX, MSZ1
        INT 21H
        
        MOV DL, '-'
        MOV AH, 2
        INT 21H
        
        NEG BX
        MOV DX, BX
        ADD DX, 48
        MOV AH, 2
        INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN