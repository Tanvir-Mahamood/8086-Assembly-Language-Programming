;Single Sum of two initialized digits 
.model small
.stack 100h
.data
    a dw 3
    b dw 4
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, a
    add ax, b
    
    mov dx, ax
    add dx, 48
    mov ah, 2
    int 21h 
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main 
    
    
    