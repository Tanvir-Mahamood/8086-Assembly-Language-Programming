.MODEL SMALL
.STACK 100H
.DATA 
    MSZ1 DB 'Enter Initial Value: $' 
    MSZ2 DB 10,13,'Enter Final Value: $'  
    OD DB 10,13,'ODD $'
    EV DB 10,13,'EVEN $'
    N DW ? 
    X DW ?
    F DB 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    LEA DX, MSZ1
    MOV AH, 9
    INT 21H    
    
    ;input code
    MOV N, 0 
    MOV BX, 10        
    INPUT:             ;input will be stored in N
        MOV AH, 1
        INT 21H 
            
        CMP AL, 13
        JE NEXT        ;go out of input level
        
        SUB AL, 30H
        MOV AH, 0      ;ax is ready     
        MOV CX, AX
        MOV AX, N
        MUL BX
        
        ADD AX, CX
        MOV N, AX
        JMP INPUT
    
    NEXT: 
        CMP F, 0
        JNE START
        
        MOV F, 1  
        MOV AX, N
        MOV X, AX      ;first value in x
        
        LEA DX, MSZ2
        MOV AH, 9
        INT 21H
        
        MOV N, 0
        MOV BX, 10
        JMP INPUT
        
    START:             ;main Task
        MOV CX, N
        SUB CX, X
        INC CX
        L1:
            MOV AX, X
            AND AX, 1
            CMP AX, 1 
            JE ODD
            LEA DX, EV
            MOV AH, 9
            INT 21H
            JMP DONE
            
            ODD:
                LEA DX,OD
                MOV AH, 9
                INT 21H
            DONE:
                INC X
            LOOP L1
            
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN