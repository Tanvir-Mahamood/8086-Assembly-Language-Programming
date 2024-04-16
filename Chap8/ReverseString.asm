.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    XOR BX, BX 
    XOR CX, CX
    L1:
        MOV AH, 1
        INT 21H
        
        CMP AL, 13
        JE NEWlINE
        
        MOV BL, AL ; BX IS READY
        
        PUSH BX ; STACK INPUT
        INC CX
        JMP L1
        
    NEWLINE:
        mov ah, 2  ;printing newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h  
        
    NEXT: 
        POP DX
        MOV AH, 2
        INT 21H 
        
        LOOP NEXT
        
        
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN