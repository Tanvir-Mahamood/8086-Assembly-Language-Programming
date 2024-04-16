; Enter 2 digits and find the subtraction. 
; It can handle positive subtraction only.
.model small
.stack 100h
.data
    str1 db 'Enter First Number : $'
    str2 db 0ah,0dh,'Enter Second Number : $'
    str3 db 0ah,0dh,'Subtruction : $' 
    
    a db ?
.code
main proc
    mov ax, @data
    mov ds, ax 
    
    lea dx, str1
    mov ah, 9
    int 21h  
    
    mov ah, 1
    int 21h 
    sub al, 48
    mov a, al
    
    lea dx, str2
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h 
    sub al, 48
    sub a, al 
    
    lea dx, str3
    mov ah, 9
    int 21h 
    
    mov dl, a
    add dl, 48
    mov ah, 2
    int 21h
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main