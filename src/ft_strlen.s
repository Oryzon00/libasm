bits 64

section .text
	global ft_strlen

	ft_strlen:
		xor rcx, rcx ;init i = 0
		;argument str is in rdi
	
	loop_start:
		cmp BYTE [rdi + rcx], 0 ;rdi = str, rcx = i, 0 = '\0'
		je loop_end ;jump if not equal
		inc rcx ; i++
		jmp loop_start
	
	loop_end:
		mov rax, rcx
		ret ;return value of i
