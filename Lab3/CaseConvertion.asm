 .model small
.stack 100h
.data
    msz1 db 'Enter Lower Case: $'
    msz2 db 'Enter Upper Case: $'
.code
main proc 
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msz1
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 32
    
    mov dl, al
    mov ah, 2
    int 21h 
    
    mov ah, 2  ;printing newline
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h  
    
    mov ah, 9
    lea dx, msz2
    int 21h   
    
    mov ah, 1
    int 21h
    add al, 32 
    
    mov dl, al
    mov ah, 2
    int 21h 
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main 
    
    
    