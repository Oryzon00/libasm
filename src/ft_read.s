bits 64

extern __erno_location

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
		neg rax ; positive value of errno code
		push rax ; save value of rax on the stack
		call __errno_location wtr ..plt ;errno adress in rax, with respecto to the Procedure Linkage Table
		pop r12 ; save errno code in r12
		mov [rax], r12 ; change value of errno (adress is in rax)
		mov rax, -1
		ret ; return -1 (error) in rax
