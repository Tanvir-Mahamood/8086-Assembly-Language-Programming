; HEX IO    
; BX CONTAINING RESULT
.MODEL SMALL
.STACK 100H
.DATA  
    F DB 0 
    F2 DB 0
    SAV DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    XOR BX, BX
    MOV CL, 4
    MOV AH, 1
    INT 21H
    
    INPUT:
        CMP AL, 13
        JE NEXT
        CMP AL, 39H    ;DIGIT OR LETTER?
        JG LETTER
        AND AL, 0FH    ;DIGIT ADJUSTMENT
        JMP SHIFT      ; GOTO INSERT BX  
        LETTER:
            SUB AL,37H ; LETTER ADJUSTMENT
        SHIFT:
            SHL BX, CL ; SHIFTING 4 BITS
            OR BL, AL  ;INSERTING HEX DIGIT
        INT 21H
        JMP INPUT 
        
    NEXT:
        mov ah, 2  ;printing newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h 
        
        MOV DL, BH
        OUTPUT:
            ROL DL, CL 
            MOV SAV, DL ;SAVINGS
            AND DL, 0FH  
            JMP PRINT 
            BAC:
            CMP F, 1
            JE NOW
            MOV F, 1
            MOV DL, SAV
            JMP OUTPUT
        NOW:
            CMP F2, 1
            JE EXIT
            MOV F2, 1
            
            MOV DL, BL
            MOV F, 0
            JMP OUTPUT 
            
            
    PRINT: 
        CMP DL, 9
        JG LET
        ADD DL, 48
        JMP DECISION
        LET: 
            ADD DL, 55
        DECISION:
            INT 21H
            JMP BAC
            
        
        
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN