bits 64


section .data
	message: db "Hello world!", 10
	msg_len: equ  $-message

section .text
	global _start
	_start:
		mov rax, 1			;syscall write
		mov rdi, 1
		mov rsi, message
		mov rdx, msg_len
		syscall

		mov rax, 60			;syscall exit
		mov rdi, 0			;xor rdi, rdi
		syscall


