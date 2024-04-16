.MODEL SMALL
.STACK 100H
.DATA  
    W DW 1,2,3,4,5,6
      DW 6,5,4,3,2,1
      DW 1,2,3,4,5,6
      DW 6,5,4,3,2,1
      DW 1,2,3,4,5,6
      
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
    
    XOR SI, SI
    MOV CX, 5
    XOR BX, BX
    L1:
        L2:
            CMP SI, 12
            JE OUT2
            
            MOV DX, W[BX][SI]
            ADD DX, 48
            MOV AH, 2
            INT 21H     
            ADD SI,2
            JMP L2
            
        OUT2:
            mov ah, 2  ;printing newline
            mov dl, 10
            int 21h
            mov dl, 13
            int 21h 
        
            XOR SI, SI
            ADD BX,12
            LOOP L1    
        
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN