.MODEL SMALL
.STACK 100H
.DATA  
    STR1 DB 30 DUP(0)  
    VOWEL DB 'AEIOU'
    CONSONANT DB 'BCDFGHJKLMNPQRSTVWXYZ'
    OUT1 DB 0DH, 0AH, 'VOWELS = $'
    OUT2 DB ' , CONSONANTS = $'
    CNT_V DW 0
    CNT_C DW 0
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
    CLD
    
    REPEAT:
        LODSB
        LEA DI, VOWEL
        MOV CX, 5
        REPNE SCASB
        JNE CK_CONST
        INC CNT_V
        JMP UNTILL
        
        CK_CONST:
            LEA DI, CONSONANT
            MOV CX, 21
            REPNE SCASB
            JNE UNTILL
            INC CNT_C
            
        UNTILL:
            DEC BX
            JNE REPEAT
            
    MOV AH, 9
    LEA DX, OUT1
    INT 21H
    MOV AX, CNT_V
    CALL OUTDEC 
    
    MOV AH, 9
    LEA DX, OUT2
    INT 21H
    MOV AX, CNT_C
    CALL OUTDEC
    
    
    
    
    ;CALL DISP_STR
    
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

OUTDEC PROC
    MOV DX, AX
    ADD DX, 48
    MOV AH, 2
    INT 21H
    RET
OUTDEC ENDP
    

END MAIN
