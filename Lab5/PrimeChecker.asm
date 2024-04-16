; Given N. Check if N is Prime or Not
.MODEL SMALL
.STACK 100H
.DATA
    msz1 db 'Enter a number: $'
    msz2 db 10,13,'Prime $'
    msz3 db 10,13,'Not Prime $'
    N DB 29  
    R DB ?
    CNT DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV CL, N 
    MOV CH, 0
    SUB CX, 2
    
    MOV BX, 0
    MOV BL, 2
    
    L1:
        MOV AX, 0
        MOV AL, N ; AX READY
        
        DIV BL
        CMP AH, 0
        JE ERROR 
        INC BL
        LOOP L1 
        
    LEA DX, MSZ2
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    ERROR:
        LEA DX, MSZ3
        MOV AH, 9
        INT 21H
        JMP EXIT
         
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN