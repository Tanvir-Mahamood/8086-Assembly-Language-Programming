; Input 2 digits and print product.
; product can consists of 2 digits.
.model small
.stack 100h
.data
.code  
    msz1 db 'Enter Multiplicand: $'
    msz2 db 0ah, 0dh,'Enter Multiplier: $'  
    msz3 db 0ah, 0dh,'Product: $'  
    a db ? 
    b db ?
main proc 
    mov ax, @data
    mov ds, ax 
    
    mov ah, 9
    lea dx, msz1
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48 
    mov a, al 
    
    mov ah, 9
    lea dx, msz2
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48
    mov b, al  
    
    mov ah, 9
    lea dx, msz3
    int 21h 
    
    mov al, a
    mul b    ;ax is ready
    
    aam
    mov bx, ax
    mov dl, bh
    add dx, 48
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