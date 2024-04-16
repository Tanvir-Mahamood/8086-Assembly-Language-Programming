;sum of array

.MODEL SMALL
.STACK 100H
.DATA 
    W DW 10,20,30,40,50,60,70,80,90,100
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX    
    
    XOR AX, AX
    LEA SI, W
    MOV CX, 10
    
    SUM:
        ADD AX, [SI]
        ADD SI, 2
        LOOP SUM
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN