.MODEL SMALL
.STACK 100H
.DATA
    R DW ?
    C DW ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    SUB AX, 48 
    MOV AH, 0
    MOV R, AX  ;R IS READY
    
    mov ah, 2  ;printing newline
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h   
    
    ROW:
        MOV CX, R   
        MOV DL, '*'
        MOV AH, 2
        
        COLUMN:
            INT 21H
            LOOP COLUMN
        
        mov ah, 2  ;printing newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        DEC R 
        CMP R, 0
        JG ROW
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN