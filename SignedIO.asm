.MODEL SMALL
.STACK 100H
.DATA
    MSZ1 DB 'Enter a number: $' 
    MSZ2 DB 10,13,'Output: $'
    N DW ?
    MIN1 DB 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    ;input code
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
        
        CMP MIN1, 1
        JNE OUTPUT
        ;NEG N 
        MOV DL, '-'
        MOV AH, 2
        INT 21H 
        ;NEG N
    
    ;output code
    OUTPUT: 
        MOV AX, N
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