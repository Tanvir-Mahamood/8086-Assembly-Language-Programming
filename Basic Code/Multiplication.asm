.model small
.stack 100h
.code   
.data
a db 2
b db 3
main proc  
    mov ax, @data
    mov ds, ax
    
    mov al, a
    mul b
    mov bx, ax
    
    mov ah, 2
    mov dx, bx 
    add dx, 48
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main