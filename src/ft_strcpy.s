bits 64

;char *strcpy(char *dest, const char *src);
section .text
	global ft_strcpy

	ft_strcpy:
		;rdi = dest
		;rsi = src
		xor rcx, rcx ; i = 0
	
	loop_start:
		cmp BYTE [rsi + rcx], 0 ; src[i] != '\0'
		je loop_end
		mov al, [rsi + rcx] ; dest[i] = src[i]
		mov [rdi + rcx], al ; mov ne prends pas de memoire a memoire
		inc rcx ; i++
		jmp loop_start
	
	loop_end:
		mov BYTE [rdi + rcx], 0 ; dest[i] = '\0'
		mov rax, rdi
		ret
