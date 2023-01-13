global _start
section .text

_start:
    ;instruction dest, source
    mov eax, 1
    mov ebx, 0
    ;xor ebx, ebx
    int 80h