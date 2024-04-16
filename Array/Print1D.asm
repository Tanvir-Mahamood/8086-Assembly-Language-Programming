.MODEL SMALL
.STACK 100H
.DATA  
    A DW 1,2,3,4,5
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX      
    
    LEA SI, A
    MOV CX, 5
    
    L1:
        MOV DX, [SI]
        ADD DX, 48 
        MOV AH, 2
        INT 21H
        ;INC SI
        ADD SI, 2
        LOOP L1
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN