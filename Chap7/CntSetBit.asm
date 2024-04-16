; 7.12 COUNT SET BIT IN BX USING ROL 
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BX, 118 ; TEST 
    
    XOR AX, AX
    MOV CX, 16
    TOP:
        ROL BX, 1
        JNC NEXT
        INC AX
        NEXT:
            LOOP TOP
        
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN