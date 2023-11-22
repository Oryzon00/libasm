bits 64

section .data
	num1: db 100
	num2: db 101

	msg1: db "num1 est egal a num2", 10
	msg1Len: equ $-msg1

	msg2: db "num1 est different de num2", 10
	msg2Len: equ $-msg2

section .bss

section .text
	global _start

	equal:
		mov rax, 1
		mov rdi, 1
		mov rsi, msg1
		mov rdx, msg1Len
		syscall
		jmp exit

	notEqual:
		mov rax, 1
		mov rdi, 1
		mov rsi, msg2
		mov rdx, msg2Len
		syscall
		jmp exit

	_start:
		mov rax, [num1]
		;mov rbx, [num2]
		cmp al, [num2]
		jne notEqual
		je equal


	exit:
		mov rax, 60
		xor rdi, rdi
		syscall
