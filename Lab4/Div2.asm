.model small
.stack 100h
.data
.code   
    a db ?
    b db ? 
    r db ?
    msz1 db 'Divident: $'
    msz2 db 0ah,0dh,'Divisor: $'  
    msz3 db 0ah,0dh,'Quotient: $'
    msz4 db 0ah,0dh,'Remainder: $'
main proc 
    mov ax, @data
    mov ds, ax  
     
    lea dx, msz1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h  
    sub al, 48
    mov a, al
    
    lea dx, msz2
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h  
    sub al, 48
    mov b, al
    
    lea dx, msz3
    mov ah, 9
    int 21h
    
    
    mov bx, 0
    mov bl, a
    mov ax, bx  ;8bit to 16 bit
    
    div b       ;ah=remainder, al=quotient  
    mov r, ah
    
    mov dl, al
    add dl, 48 
    mov ah, 2
    int 21h
    
    
    lea dx, msz4
    mov ah, 9
    int 21h
    
    mov dl, r 
    add dl, 48
    mov ah, 2
    int 21h
    
    
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main