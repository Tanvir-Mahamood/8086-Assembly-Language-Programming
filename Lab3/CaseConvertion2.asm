.model small
.stack 100h
.data
    str1 db 'Enter lower case letter: $'
    str2 db 0ah,0dh,'Enter upper case letter: $' 
    str3 db 0ah,0dh,'Upper case letter: $'
    str4 db 0ah,0dh,'Lower case letter: $' 
.code
main proc
    mov ax, @data
    mov ds, ax 
    
    mov ah, 9
    lea dx, str1
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 32  
    mov bl, al
    
    mov ah, 9
    lea dx, str3
    int 21h 
    
    mov dl, bl
    mov ah, 2
    int 21h 
    
    
    mov ah, 9
    lea dx, str2
    int 21h
    
    mov ah, 1
    int 21h
    add al, 32  
    mov bl, al
    
    mov ah, 9
    lea dx, str4
    int 21h 
    
    mov dl, bl
    mov ah, 2
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main