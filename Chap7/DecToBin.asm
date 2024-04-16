;Decimal to Bin
.MODEL SMALL
.STACK 100H
.DATA
    N DW ?   ;containing decimal input
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
        MOV CX, 16
        OUTPUT:  
            SHL BX, 1
            JC ONE
            MOV DL, 0
            JMP PRINT:
            ONE:
                MOV DL, 1
            PRINT:
                ADD DL, 48
                INT 21H
                LOOP OUTPUT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN