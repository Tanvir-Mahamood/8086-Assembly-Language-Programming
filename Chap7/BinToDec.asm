; Binary To Decimal   
; BX CONTAINING RESULT
.MODEL SMALL
.STACK 100H
.DATA 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    XOR BX, BX
    MOV AH, 1
    INT 21H
    
    INPUT:
        CMP AL, 13   ; CR?
        JE NEWLINE
        AND AL, 0FH  ; SUB AL, 48
        SHL BX, 1
        OR BL, AL
        INT 21H
        JMP INPUT
        
    NEWLINE: 
        mov ah, 2  ;printing newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h 
        
        OUTPUT:            ;output stored in N
        MOV AX, BX
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