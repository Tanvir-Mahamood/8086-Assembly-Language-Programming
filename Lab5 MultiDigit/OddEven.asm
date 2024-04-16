;Enter a number(with multiple digits defined in word)
;and check if it is odd or even
.MODEL SMALL
.STACK 100H
.DATA
    MSZ1 DB 'Enter a number: $'
    MSZ2 DB 10,13,'The Number is $' 
    OD DB 'ODD $'
    EV DB 'EVEN $'
    N DW ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
    
    LEA DX, MSZ1
    MOV AH, 9
    INT 21H
    
    ;input code
    MOV N, 0 
    MOV BX, 10        
    INPUT:             ;input will be stored in N
        MOV AH, 1
        INT 21H 
            
        CMP AL, 13
        JE NEXT        ;go out of input level
        
        SUB AL, 30H
        MOV AH, 0       
        MOV CX, AX
        MOV AX, N
        MUL BX
        
        ADD AX, CX
        MOV N, AX
        JMP INPUT
    
    NEXT: 
        LEA DX, MSZ2
        MOV AH, 9
        INT 21H
        
        MOV AX, N
        AND AX, 1
        CMP AX, 1
        JE ODD
        LEA DX, EV
        MOV AH, 9
        INT 21H
        JMP EXIT
        
        ODD:
            LEA DX, OD
            MOV AH, 9
            INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN