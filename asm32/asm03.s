section .bss
	Buffer: resb 5
	BufferSize: equ $-Buffer

section .data
	msg:db '1337', 10
	lg: equ $-msg
	comp: db'42'

section .text
	global _start

 _start:

	;saisie
	mov eax, 3
	mov ebx, 0
	mov ecx, Buffer
	mov edx, BufferSize
	int 80h

	;comparaison
	mov ax, [Buffer]
	mov bx, [comp]
	cmp bx, ax
	jz equal

	not_equal : 
	mov eax, 1
	mov ebx, 1
	int 80h

	equal :

	;affiche 1337
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, lg
    int 80h

	mov eax, 1
	mov ebx, 0
	int 80h