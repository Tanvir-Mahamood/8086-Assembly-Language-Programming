; Bracket Sequence Problem.
; Given a statement consists of brackets and digits.
; Determine if the statement is meaningful or not.
; [5+2()} is not meaningful statement
.MODEL SMALL
.STACK 100H
.DATA
    ER DB 10,13,'Error $'
    CR DB 10,13,'Correct $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
     
    XOR CX, CX
    L1:
        XOR BX, BX
        MOV AH, 1
        INT 21H
        
        CMP AL, 13
        JE NEWlINE 
        
        CMP AL, '('
        JE INSERT  
        
        CMP AL, '{' 
        JE INSERT
        
        CMP AL, '['
        JE INSERT
        
        CMP AL, ')'
        JE REMOVE1   
        
        CMP AL, '}' 
        JE REMOVE2
        
        CMP AL, ']'
        JE REMOVE3
        
        JMP L1
        
        INSERT:
            MOV BL, AL ; BX READY
            PUSH BX
            INC CX
            JMP L1  
        REMOVE1:   
            JCXZ ERROR
            POP DX
            DEC CX
            
            CMP DX, '('
            JNE ERROR
            
            JMP L1
        REMOVE2:   
            JCXZ ERROR
            POP DX
            DEC CX
            
            CMP DX, '{'
            JNE ERROR
            
            JMP L1 
       REMOVE3:   
            JCXZ ERROR
            POP DX
            DEC CX
            
            CMP DX, '['
            JNE ERROR
            
            JMP L1
        
    NEWLINE:
        CMP CX, 0
        JNE ERROR
    
        LEA DX, CR
        MOV AH, 9
        INT 21H
        JMP EXIT
    
        
    ERROR:
        LEA DX, ER
        MOV AH, 9
        INT 21H
        
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN  