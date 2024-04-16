; Take input a range (say 12 to 24),
; Check all the numbers in the range 
; if they are Prime or not.

.MODEL SMALL
.STACK 100H
.DATA 
    MSZ1 DB 'Enter Initial Value: $' 
    MSZ2 DB 10,13,'Enter Final Value: $'  
    MSZ3 DB 10,13,'1 is neither prime nor composite $'
    PR DB 10,13,'Prime $'
    NP DB 10,13,'Composite $'
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
            CMP AX, 1
            JE  SPECIAL ; to handle case of 1
            MOV BX, 0
            MOV BL, 2
            L2:
                CMP BX, X
                JGE COMPLETE
                DIV BL ; REMAINDER IN AH
                CMP AH, 0
                JE ERROR 
                MOV AX, X
                INC BL
                JMP L2 
                
                ERROR:
                    LEA DX, NP
                    MOV AH, 9
                    INT 21H 
                    JMP DONE
                
                COMPLETE:
                    LEA DX, PR
                    MOV AH, 9
                    INT 21H 
                    JMP DONE
            SPECIAL:
                LEA DX, MSZ3
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