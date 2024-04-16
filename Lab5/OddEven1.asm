; Enter a digit to check if the digit
; is odd or even.
.MODEL SMALL
.STACK 100H
.DATA 
    MSZ1 DB 10,13,'ODD $' 
    MSZ2 DB 10,13,'EVEN $'
    MSZ3 DB 'Enter A Digit: $'  
    A DB ?
    B DB 2
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    LEA DX, MSZ3
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H   
    SUB AL, 48
    MOV AH, 0 ; AX IS READY
    
    DIV B   ; AH = REMAINDER  
    
    CMP AH, 1
    JE L1
    LEA DX, MSZ2
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    L1:
       LEA DX, MSZ1
       MOV AH, 9
       INT 21H 
    
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN