section .data
    asm db 'asm01',0

section .text
global _start

_start:
    ;AVOIR ASM01 DE GENERER
    mov eax, 11
    mov ebx, asm
    mov edx, 0
    int 0x80