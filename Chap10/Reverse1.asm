;Reverse of array, Register Indirect Mode

.MODEL SMALL
.STACK 100H
.DATA 
    W DW 0,1,2,3,4,5,6,7,8,9
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX    
    
    LEA SI, W  
    MOV BX, 10 ; SIZE OF ARRAY
    
    MOV DI, SI ; DI PUTS THE 1ST WORD
    MOV CX, BX ; CX = N
    DEC BX     ; BX = N-1
    SHL BX, 1  ; BX = 2*(N-1)
    ADD DI, BX ; DI = BX = LAST WORD 
    SHR CX, 1  ; CX = N / 2
    
    XCHG_LOOP: 
        CALL SWAP   ; SWAP([SI], [DI]) USING AX
        ADD SI, 2
        SUB DI, 2
        LOOP XCHG_LOOP 
    
    MOV CX, 10
    LEA SI, W
    PRINT:
        MOV DX, [SI]
        ADD DX, 48
        MOV AH, 2
        INT 21H
        ADD SI, 2
        LOOP PRINT
        
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP

SWAP PROC
    MOV AX, [SI]
    XCHG AX, [DI]
    MOV [SI], AX    
    RET
    SWAP ENDP

END MAIN