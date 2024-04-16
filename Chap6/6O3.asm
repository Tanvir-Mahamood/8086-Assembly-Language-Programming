;6.3 Al and Bl contain extended ASCII characters.
;Display that one come first

.MODEL SMALL
.STACK 100H
.DATA 
.CODE
MAIN PROC
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV AH, 1
    INT 21H   ;BL AND AL READY RESPECTIVELY
    
    MOV AH, 2
    CMP AL, BL
    JNBE ELSE_
    
    MOV DL, AL
    JMP DISPLAY
    
    ELSE_:
        MOV DL, BL
    DISPLAY:
        INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN