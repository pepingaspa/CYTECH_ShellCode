global _start
section .text

_start:
    ;instruction dest, source
    mov rax, 1
    mov rbx, 0
    ;xor rbx, rbx
    int 80h