;Positive Subtruction of two input digits 
.model small
.stack 100h
.data
    a db ?
    b db ?
.code
main proc
    mov ax, @data
    mov ds, ax 
    
    mov ah, 1
    int 21h
    sub al, 48
    mov a, al
    
    mov ah, 1
    int 21h
    sub al, 48
    mov b, al
    
    mov al, a
    sub al, b
    
    mov dl, al
    add dl, 48
    mov ah, 2
    int 21h 
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main 
    
    
    