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

    mov eax, 4
    mov ebx, 1
    mov ecx, msgS
    mov edx, lgS
    int 80h

    ; saisie
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 4
    int 0x80

    ; pair
    mov eax, [input]
    and eax, 1
    cmp eax, 0
    je is_even

    ; impair
    mov eax, 4
    mov ebx, 1
    mov ecx, msgI
    mov edx, lgI
    int 80h

    mov eax, 1
    xor ebx, ebx
    inc ebx
    int 0x80

is_even:
    ;pair

    mov eax, 4
    mov ebx, 1
    mov ecx, msgP
    mov edx, lgP
    int 80h

    mov eax, 1
    xor ebx, ebx
    int 0x80