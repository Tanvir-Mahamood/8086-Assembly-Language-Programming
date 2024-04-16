.model small
.stack 100h
.data
    str1 db "Hello World ",0ah,0dh,"$"
    str2 db "Tanvir $"  
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, str1
    mov ah, 9
    int 21h 
    
    lea dx, str2
    mov ah, 9
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main