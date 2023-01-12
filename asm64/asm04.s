section .data
    input dd 0

	msgI:db 'Impair', 10
	lgI: equ $-msgI

    msgP:db 'Pair', 10
	lgP: equ $-msgP

    msgS:db 'Saisir un nombre', 10
	lgS: equ $-msgS

section .text
    global _start

_start:

    mov rax, 4
    mov rbx, 1
    mov rcx, msgS
    mov rdx, lgS
    int 80h

    ; saisie
    mov rax, 3
    mov rbx, 0
    mov rcx, input
    mov rdx, 4
    int 0x80

    ; pair
    mov rax, [input]
    and rax, 1
    cmp rax, 0
    je is_even

    ; impair
    mov rax, 4
    mov rbx, 1
    mov rcx, msgI
    mov rdx, lgI
    int 80h

    mov rax, 1
    xor rbx, rbx
    inc rbx
    int 0x80

is_even:
    ;pair

    mov rax, 4
    mov rbx, 1
    mov rcx, msgP
    mov rdx, lgP
    int 80h

    mov rax, 1
    xor rbx, rbx
    int 0x80