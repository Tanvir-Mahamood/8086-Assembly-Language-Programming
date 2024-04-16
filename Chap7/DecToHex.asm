;Decimal to hex
.MODEL SMALL
.STACK 100H
.DATA
    N DW ?   ;containing decimal input
    F DB 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    ;input code
    MOV N, 0 
    MOV BX, 10        
    INPUT:             ;input will be stored in N
        MOV AH, 1
        INT 21H 
            
        CMP AL, 13
        JE NEWLINE        ;go out of input level
        
        SUB AL, 30H
        MOV AH, 0       
        MOV CX, AX
        MOV AX, N
        MUL BX
        
        ADD AX, CX
        MOV N, AX
        JMP INPUT
    
    NEWLINE:
        mov ah, 2  ;printing newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        MOV BX, N
        MOV CL, 4
         
        ROTATE:
            ROL BX, CL
            MOV DL, BL
            AND DL, 0FH ;MASK 
            JMP PRINT    
            BAC:
            INC F
            CMP F, 4
            JE EXIT  
            JMP ROTATE
            
    PRINT: 
        CMP DL, 9
        JG LET
        ADD DL, 48
        JMP DECISION
        LET: 
            ADD DL, 55
        DECISION:
            INT 21H
            JMP BAC
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN