;Negative subtruction of 2 digits
.model small
.stack 100h
.data
a dw 3
b dw 5  
sum dw ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, a
    sub ax, b    
    neg ax
    mov bx, ax  
    
    mov dl, '-'
    mov ah, 2 
    int 21h
    
    mov dx, bx
    add dx, 48
    mov ah, 2
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main