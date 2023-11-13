bits 64

global _start

section .data
	message db "Hello word!", 10

section .text
	_start:
		mov rax, 1
		mov rdi, 1
		mov rsi, message
		mov rdx, 12 + 1
		syscall

		mov rax, 60
		mov rdi, 0
		syscall

; This is a comment


; <Etiquette / label>:
; 	<instruction> <operand(s)>
; 	<instruction> <operand(s)>
; 	<instruction> <operand(s)>

; Directives
; Ex: bits 64, global, section, extern
; section == segment
