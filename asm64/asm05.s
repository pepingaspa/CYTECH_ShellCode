section .data
    asm db 'asm01',0

section .text
global _start

_start:
    ;AVOIR ASM01 DE GENERER
    mov rax, 11
    mov rbx, asm
    mov rdx, 0
    int 0x80