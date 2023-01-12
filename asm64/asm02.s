global _start

section .data
    msg:db '1337', 10
    lg: equ $-msg

section .text

_start:
    ;affiche 1337
    mov rax, 4
    mov rbx, 1
    mov rcx, msg
    mov rdx, lg
    int 80h

    mov rax, 1
    mov rbx, 0
    int 80h