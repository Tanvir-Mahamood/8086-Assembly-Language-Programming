.MODEL SMALL
.STACK 100H
.DATA  
    A DW 7
    B DW 13
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    CALL MULTIPLY
    ;DX CONTAINING PRODUCT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
;END MAIN 

MULTIPLY PROC
    MOV AX, A
    MOV BX, B
    
    PUSH AX
    PUSH BX
    
    XOR DX, DX ;PRODUCT CONTAINER
    
    REPEAT:
        TEST BX, 1 ;IF IT IS ODD
        JZ END_IF
        
        ADD DX, AX
        
        END_IF:
            SHL AX, 1
            SHR BX, 1
            JNZ REPEAT
    POP BX
    POP AX
    
    RET 
MULTIPLY ENDP

END MAIN
