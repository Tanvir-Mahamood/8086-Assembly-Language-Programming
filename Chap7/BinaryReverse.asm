; Binary STRING REVERSE    
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
        JE NEXT
        AND AL, 0FH  ; SUB AL, 48
        SHL BX, 1
        OR BL, AL
        INT 21H
        JMP INPUT
        
    NEXT: 
        mov ah, 2  ;printing newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h  
        
        MOV AX, BX ; RESULT IN AX
        XOR BX, BX
        MOV CX, 16
        REVERSE:
            SHL AX, 1 
            RCR BX, 1
            LOOP REVERSE
        ;BX CONTAING REVERSED STRING
        
        MOV AH, 2 
        MOV CX, 16
        OUTPUT:  
            SHL BX, 1
            JC ONE
            MOV DL, 0
            JMP PRINT:
            ONE:
                MOV DL, 1
            PRINT:
                ADD DL, 48
                INT 21H
                LOOP OUTPUT
            
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN