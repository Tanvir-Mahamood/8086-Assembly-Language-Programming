;Double Sum of two initialized digits 
.model small
.stack 100h
.data
    a dw 6
    b dw 4
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, a
    add ax, b 
    
    aaa
    mov bx, ax
    mov dl, bh
    add dl, 48
    mov ah, 2
    int 21h 
    mov dl, bl
    add dl, 48
    mov ah, 2
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main 
    
    
    