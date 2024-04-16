.MODEL SMALL
.STACK 100H
.DATA  
    STR1 DB 10 DUP(0)
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
    MOV ES, AX
    
    LEA DI, STR1
    CALL READ_STR
    
    mov ah, 2  ;printing newline
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    
    LEA SI, STR1
    CALL DISP_STR
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP


READ_STR PROC
    ; di = offset address of str1
    ; bx = number of charaters
    
    PUSH AX
    PUSH DI
    
    CLD
    XOR BX, BX
    
    MOV AH, 1
    INT 21H
    
    WHILE1:
        CMP AL, 0DH    ; cr?
        JE END_WHILE1  
        
        CMP AL, 8H     ; backspace?
        JNE ELSE1
        
        DEC DI
        DEC BX
        JMP READ
        
        ELSE1:
            STOSB
            INC BX
        READ:
            INT 21H
            JMP WHILE1
        END_WHILE1:
            POP DI
            POP AX
            RET
        
READ_STR ENDP  

DISP_STR PROC
    ; si = offset address of str1
    ; bx = number of characters
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI  
    
    MOV CX, BX
    JCXZ P_EXIT
    
    CLD
    
    MOV AH, 2
    
    TOP:
        LODSB
        MOV DL, AL
        INT 21H
        LOOP TOP
    
    P_EXIT:
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        RET 
        
DISP_STR ENDP
    

END MAIN
