; HEX to Bin
; BX CONTAINING RESULT
.MODEL SMALL
.STACK 100H
.DATA  
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