;take input of 2 numbers as words(16bit). Multiply them.
.MODEL SMALL
.STACK 100H
.DATA
    N DW ?
    N1 DW ?
    MIN1 DB 0 
    F DB 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    COME:
    MOV N, 0 
    MOV BX, 10 
    MOV AH, 1
    INT 21H 
    
    CMP AL, '-'
    JNE INPUT
    INC MIN1   
    JMP INPUT2
           
    INPUT:             ;input will be stored in N  
        CMP AL, 13
        JE NEXT        ;go out of input level
        
        SUB AL, 30H
        MOV AH, 0       
        MOV CX, AX
        MOV AX, N
        MUL BX
        
        ADD AX, CX
        MOV N, AX  
        
        INPUT2:
        MOV AH, 1
        INT 21H
        
        JMP INPUT
    
    NEXT: 
        mov ah, 2  ;printing newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h  
        
        CMP MIN1, 1 ;NEGATIVE ADJUSTMENT
        JNE LOW
        NEG N  
        DEC MIN1   
        
        LOW:
            CMP F, 1
            JE OPERATION
            INC F
            MOV AX, N
            MOV N1, AX   
            JMP COME
    
    
    OPERATION:
        MOV AX, N1
        MOV BX, N
        MUL BX
        MOV BX, AX
        
    
    
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN