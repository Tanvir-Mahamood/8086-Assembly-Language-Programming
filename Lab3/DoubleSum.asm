; double digit sum of two digits. 
; Example: 9 + 9 = 18
.model small
.stack 100h
.data
    str1 db 'Enter First Digit : $'
    str2 db 0ah,0dh,'Enter Second Digit : $'
    str3 db 0ah,0dh,'Sum : $' 
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
    add a, al 
    
    lea dx, str3
    mov ah, 9
    int 21h
    
    mov ah, 0
    mov al, a ;ax is ready
    
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