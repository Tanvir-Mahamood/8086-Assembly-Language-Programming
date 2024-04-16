;initialize variable and rint them
.model small
.stack 100h
.data
msz db 3   ;initialized by 3
msz1 db ?  ;user input
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 2  
    add msz, 48
    mov dl, msz
    int 21h  
    
    mov ah, 1
    int 21h
    mov msz1, al
    
    mov ah, 2  ;printing newline
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    
    mov ah, 2
    mov dl, msz1
    int 21h
     
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main