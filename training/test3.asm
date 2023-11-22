bits 64


section .data
	msg: db "Message 123", 10
	msgLen: equ $-msg

section .bss

section .text
	global _start

	_start:
	mov rbx, 0

	loop_start:
		cmp rbx, 5
		jge loop_end

		mov rax, 1
		mov rdi, 1
		mov rsi, msg
		mov rdx, msgLen
		syscall

		inc rbx
		jmp loop_start

	loop_end:
		jmp exit

	exit:
		mov rax, 60
		xor rdi, rdi
		syscall


		
