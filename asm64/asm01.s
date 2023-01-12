section .data
section .text
    global _start

_start:
    mov eax, 60
    xor rdi, rdi
    syscall