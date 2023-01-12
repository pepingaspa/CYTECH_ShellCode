global _start

section .data
    msg:db '1337', 10
    lg: equ $-msg

section .text

_start:
    ;affiche 1337
    mov eax, 4                            
    mov ebx, 1                            
    mov ecx, msg                       
    mov edx, lg                   
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h         