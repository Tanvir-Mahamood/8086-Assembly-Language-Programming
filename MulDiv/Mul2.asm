;take input of 2 numbers as bytes(8bit). Multiply them.
.MODEL SMALL
.STACK 100H
.DATA
    N DB ?
    N1 DB ?
    MIN1 DB 0 
    F DB 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    COME:
    MOV N, 0 
    MOV BL, 10 
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
        MOV CH, 0      
        MOV CL, AL
        MOV AL, N
        MUL BL
        
        ADD AX, CX
        MOV N, AL  
        
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
        NEG N       ;making signed number
        DEC MIN1   
        
        LOW:
            CMP F, 1
            JE OPERATION
            INC F
            MOV AL, N
            MOV N1, AL   
            JMP COME
    
    
    OPERATION: 
        MOV AL, N1
        MOV BL, N
        IMUL BL 
        MOV BX, AX
        
        CMP AX, 0
        JGE OUTPUT
        MOV DL, '-'
        MOV AH, 2
        INT 21H 
        MOV AX, BX
        NEG AX
        
    ;output code
    OUTPUT: 
        MOV DX, 0
        MOV BX, 10
        MOV CX, 0
    
        L1:            ;stack input
            DIV BX
            
            PUSH DX    ;SAVE IN STACK
            MOV DX, 0
            INC CX     ;counting size of stack
            CMP AX, 0
            JNE L1
            MOV AH, 2
        L2:            ;stack output
            POP DX
            ADD DX, 48
            INT 21H
            LOOP L2
        
    
    
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN