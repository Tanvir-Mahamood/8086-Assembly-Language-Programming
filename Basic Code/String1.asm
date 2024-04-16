;initialized string output
.model small
.stack 100h
.data
m db 'I Love Bangladesh $'
.code
main proc
    mov ax, @data  ;initialized data segment to convert it into code segment
    mov ds, ax   
    
    mov ah, 9
    lea dx, m ;load effective address
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main