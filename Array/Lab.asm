; clear 3rd row and 3rd column
.MODEL SMALL
.STACK 100H
.DATA  
    W DW 1,2,3,4,5,6
      DW 6,5,4,3,2,1
      DW 1,2,3,4,5,6
      DW 6,5,4,3,2,1
      DW 1,2,3,4,5,6
    CNT DW 0
      
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
    
    MOV SI, 4
    XOR BX, BX
    MOV CX, 5
    EDIT1:
        MOV W[BX][SI], 0
        ADD BX, 12
        LOOP EDIT1 
    
    
    MOV BX, 24
    XOR SI, SI
    MOV CX, 6
    EDIT2:
        MOV W[BX][SI], 0
        ADD SI, 2  
        LOOP EDIT2
    
    
    MOV CX, 30
    LEA BX, W
    L1:
        MOV DX, [BX]
        ADD DX, 48
        MOV AH, 2
        INT 21H 
        
        INC CNT
        CMP CNT, 6
        JNE L2
        
        mov ah, 2  ;printing newline
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        MOV AX, 0
        MOV CNT, AX 
        
        L2:
        ADD BX, 2
        LOOP L1
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN