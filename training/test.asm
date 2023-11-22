bits 64



section .data
	STDIN: equ 0
	STDOUT: equ 1
	SYSCALL_WRITE: equ 1
	SYSCALL_READ: equ 0
	SYSCALL_EXIT: equ 60
	message: db "What is your name ?", 10
	messageLen: equ $-message
	message2: db "Your name is: "
	message2Len: equ $-message2
	usernameMaxLen: equ 256

section .bss
	username: resb usernameMaxLen


section .text
	global _start
	_start:

		; Affichage de la question
		mov rax, SYSCALL_WRITE
		mov rdi, STDOUT
		mov rsi, message
		mov rdx, messageLen
		syscall

		; Lecture user input
		mov rax, SYSCALL_READ
		mov rdi, STDIN
		mov rsi, username
		mov rdx, usernameMaxLen
		syscall


		;Save len of user input (return of syscall read)
		mov rbx, rax

		;Affichage de la reponse
		mov rax, SYSCALL_WRITE
		mov rdi, STDOUT
		mov rsi, message2
		mov rdx, message2Len
		syscall

		;Affichage du username
		mov rax, SYSCALL_WRITE
		mov rdi, STDOUT
		mov rsi, username
		mov rdx, rbx
		syscall

		; exit success
		mov rax, SYSCALL_EXIT
		xor rdi, rdi
		syscall
