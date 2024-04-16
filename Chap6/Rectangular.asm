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
    
    MOV AH, 1
    INT 21H
    SUB AX, 48
    MOV AH, 0
    MOV C, AX
    
    mov ah, 2  ;printing newline
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
               
    COLUMN:  
    DEC R
    MOV CX, C  
    MOV AH, 2
    MOV DL, '*'
    
    ROW:
        INT 21H
        LOOP ROW  
        
        mov ah, 2  ;printing newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
    CMP R, 0
    JG  COLUMN
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN