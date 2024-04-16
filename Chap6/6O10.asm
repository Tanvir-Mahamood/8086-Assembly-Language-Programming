;6.10 read untill a blank is read

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    MOV AH, 1
    REPEAT_:
    INT 21H
    CMP AL, ' '
    JNE REPEAT_ 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN