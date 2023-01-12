section .bss
    Buffer: resb 64
    BufferSize: equ $-Buffer
    
section .data
    msg: db 'Entrez un nombre :', 10
    lg: equ $-msg

section .text
    global _start

_start:

    ;affichage
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, lg
    int 80h

    ;saisie
	mov eax, 3
	mov ebx, 0
	mov ecx, Buffer
	mov edx, BufferSize
	int 80h

    ;comparaison
    mov ax, 54
    mov bx, 2
    div bx
    cmp ah, 0
    jz equal

    ;equal
    equal :

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, lg
    int 80h

    mov eax, 1
	mov ebx, 0
	int 80h 

    ;not equal
    not_equal :
    mov eax, 1
	mov ebx, 0
	int 80h

    ;END OF PRG
    mov eax, 1
	mov ebx, 0
	int 80h