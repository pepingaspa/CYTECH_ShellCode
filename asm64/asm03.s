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
	mov rax, 3
	mov rbx, 0
	mov rcx, Buffer
	mov rdx, BufferSize
	int 80h

	;comparaison
	mov ax, [Buffer]
	mov bx, [comp]
	cmp bx, ax
	jz equal

	not_equal : 
	mov rax, 1
	mov rbx, 1
	int 80h

	equal :

	;affiche 1337
    mov rax, 4
    mov rbx, 1
    mov rcx, msg
    mov rdx, lg
    int 80h

	mov rax, 1
	mov rbx, 0
	int 80h