; Given a range (say 1 to 20). For each number,
; print odd or even.
.MODEL SMALL
.STACK 100H
.DATA 
    MSZ1 DB ' IS ODD ',10,13,'$' 
    MSZ2 DB ' IS EVEN ',10,13,'$'  
    A DB 1
    B DB 20 
    D DB 2
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV CL, B 
    MOV CH, 0
    L1: 
        MOV AL, A
        MOV AH, 0 ;AX READY  
        
        DIV D
        
        CMP AH, 1
        JE ODD
        LEA DX, MSZ2
        MOV AH, 9
        INT 21H
        JMP DONE
        
        ODD:
           LEA DX, MSZ1
           MOV AH, 9
           INT 21H
           JMP DONE  
           
        DONE:
            INC A
        
        LOOP L1
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN