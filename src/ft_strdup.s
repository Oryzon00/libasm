bits 64

extern ft_strlen
extern ft_strcpy
extern malloc

section .text
	global ft_strdup

	;char *strdup(const char *str);
	ft_strdup:
		;rdi = str
		call ft_strlen ;arg in rdi
		; --> len is in rax
		inc rax ; len + 1 pour malloc
		mov rsi, rdi ; save str for strcpy
		mov rdi, rax
		call malloc wrt ..plt;arg in rdi
		; --> allocated address in rax
		mov rdi, rax ;dest = rdi
		call ft_strcpy ; args in rdi and rsi
		; modified str in rax 
		ret
