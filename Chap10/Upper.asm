; Lower case to upper case using index ddressing mode
.MODEL SMALL
.STACK 100H
.DATA 
    MSZ DB 'this is a Message$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV CX, 17
    XOR SI, SI
    
    TOP:
        CMP MSZ[SI], ' '
        JE NEXT   
        CMP MSZ[SI], 'a'
        JL NEXT
        AND MSZ[SI], 0DFH
    NEXT: 
        INC SI
        LOOP TOP
    
    XOR SI, SI
    MOV CX, 17
    PRINT:
        MOV DL, MSZ[SI]
        MOV AH, 2
        INT 21H
        INC SI
        LOOP PRINT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN