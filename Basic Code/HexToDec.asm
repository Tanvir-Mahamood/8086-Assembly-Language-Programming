;hex digit(0,1,...,9,A,B,C,D,E) to decimal digit
.model small
.stack 100h
.data
a db 'Input a hex digit : $'    
b db 'In Decimal digit : $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al 
    
    cmp bl, 64d  
    jge aa 
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, b
    int 21h
    mov ah, 2
    mov dl, bl
    int 21h 
    jmp exit
    
    aa:
    sub bl, 17d ; C -> 67-50='2'
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, b
    int 21h
    
    mov dl, 49d ;printint 1 at the first
    mov ah, 2
    int 21h
    
    mov dl, bl
    mov ah, 2
    int 21h 
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main