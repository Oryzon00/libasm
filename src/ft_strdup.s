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
		cmp rax, 0 ;check if malloc failed
		je end_function ;jump to return if malloc failed
		mov rdi, rax ;dest = rdi
		call ft_strcpy ; args in rdi and rsi
		; modified str in rax

		end_function:
			ret
