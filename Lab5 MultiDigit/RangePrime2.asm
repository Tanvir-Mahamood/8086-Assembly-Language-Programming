.MODEL SMALL
.STACK 100H
.DATA 
    MSZ1 DB 'Enter Initial Value: $' 
    MSZ2 DB 10,13,'Enter Final Value: $'  
    MSZ3 DB ' is neither prime nor composite $'
    PR DB ' is Prime $'
    NP DB ' is Composite $'
    N DW ? 
    M DW ?
    X DW ?
    F DB 0 
    CNT DW 1
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
        MOV CNT, CX ; CNT IS THE LOOP COUNTER
        L1:
            CMP CNT, 0
            JE EXIT  
            
            mov ah, 2  ;printing newline
            mov dl, 10
            int 21h
            mov dl, 13
            int 21h  
            
            MOV CX, X
            MOV M, CX
            JMP OUTPUT
            
            CON:
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
            DEC CNT
            JMP L1 
            
    
    ;output code
    OUTPUT:            ;output stored in N
        MOV AX, M
        MOV DX, 0
        MOV BX, 10
        MOV CX, 0
    
        LE1:            ;stack input
            DIV BX
            
;in case of 8  bit register, AL = quotient, AH = remainder 
;in case of 16 bit register, AX = quotient, DX = remainder

            PUSH DX    ;SAVE IN STACK
            MOV DX, 0
            INC CX     ;counting size of stack
            CMP AX, 0
            JNE LE1
            MOV AH, 2
        LE2:            ;stack output
            POP DX
            ADD DX, 48
            INT 21H
            LOOP LE2
            JMP CON
            
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN