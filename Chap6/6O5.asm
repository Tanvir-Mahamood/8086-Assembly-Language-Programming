;6.5 IF(AL == 1 OR AL == 3)      PRINT O 
;    ELSE IF(AL == 2 OR AL == 4) PRINT E

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    MOV AH, 1
    INT 21H
    SUB AL, 48
    
    CMP AL, 1
    JE ODD
    CMP AL, 3
    JE ODD 
    
    CMP AL, 2
    JE EVEN
    CMP AL, 4
    JE EVEN
    
    ODD:
        MOV DX, 'O'
        MOV AH ,2
        INT 21H
        JMP EXIT
    EVEN:
        MOV DX, 'E'
        MOV AH ,2
        INT 21H
        
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN