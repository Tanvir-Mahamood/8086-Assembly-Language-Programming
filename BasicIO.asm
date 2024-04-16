.MODEL SMALL
.STACK 100H
.DATA
    MSZ1 DB 'Enter a number: $' 
    MSZ2 DB 10,13,'Output: $'
    N DW ?
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
        JE NEXT        ;go out of input level
        
        SUB AL, 30H
        MOV AH, 0       
        MOV CX, AX
        MOV AX, N
        MUL BX
        
        ADD AX, CX
        MOV N, AX
        JMP INPUT
    
    NEXT: 
        LEA DX, MSZ2
        MOV AH, 9
        INT 21H
    
    ;output code
    OUTPUT:            ;output stored in N
        MOV AX, N
        MOV DX, 0
        MOV BX, 10
        MOV CX, 0
    
        L1:            ;stack input
            DIV BX
            
;in case of 8  bit register, AL = quotient, AH = remainder 
;in case of 16 bit register, AX = quotient, DX = remainder

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