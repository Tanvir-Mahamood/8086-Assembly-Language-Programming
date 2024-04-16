;take input of 2 numbers as words(16bit).CONVERT IT 16 AND 8 BIT
;DIVIDE them.
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
        XOR BX, BX
        MOV AX, N1
        MOV BX, N
        IDIV BL 
        MOV N1, AX   
        MOV AH, 0
        MOV BL, AL
        
        CMP AL, 0
        JGE OUTPUT
        MOV DL, '-'
        MOV AH, 2
        INT 21H 
        NEG BL
        MOV AH, 0
        MOV AL, BL
        
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
    
        
    CMP F, 0
    JE EXIT
    DEC F
    mov ah, 2  ;printing newline
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    
    MOV BX, N1
    MOV AH, 0
    MOV AL, BH
    CMP AL, 0
    JGE OUTPUT 
    NEG AL
    MOV BL, AL
    
    MOV DL, '-'
    MOV AH, 2
    INT 21H
    
    MOV AH, 0
    MOV AL, BL
    JMP OUTPUT
    
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN