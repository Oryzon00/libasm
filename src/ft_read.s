bits 64

section .text
	global ft_read

	ft_read:
; 	arguments are  in the registers 
; 	RDI, RSI, RDX, RCX, R8, and R9
		mov rax, 0 ; syscall read
		syscall
		cmp rax, 0 ; cmp le retour du syscall read
		jl _handle_error ;jump to handle lower if rax < 0
		ret ; return value in rax 
	
	_handle_error:

		mov rax, -1
		ret ; return -1 (error) in rax
