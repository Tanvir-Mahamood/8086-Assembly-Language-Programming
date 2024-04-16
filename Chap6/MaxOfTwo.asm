;6.1 AX AND BX CONTAIN SIGNED NUMBERS
;PUT THE BIGGEST ONE IN CX

.MODEL SMALL
.STACK 100H
.DATA  
    MSZ1 DB 'Enter first number $'   
    MSZ2 DB 0AH,0DH,'Enter second number $'
    MSZ3 DB 0AH,0DH,'Highest $'
.CODE
MAIN PROC 
    MOV DX, @DATA
    MOV DS, DX
    
    MOV AH, 9
    LEA DX, MSZ1
    INT 21H
    
    MOV AH, 1
    INT 21H
    ;SUB AL, 48
    MOV BH, 0
    MOV BL, AL ; BX IS READY
    
    MOV AH, 9
    LEA DX, MSZ2
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV AH, 0  ;AX IS READY 
    
    MOV CX, AX
    CMP BX, AX
    JLE PRINT
    MOV CX, BX
    JMP PRINT
    
    PRINT: 
        MOV AH, 9
        LEA DX, MSZ3
        INT 21H  
        
        MOV DX, CX
        MOV AH, 2
        INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN