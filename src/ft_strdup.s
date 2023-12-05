bits 64

extern ft_strlen
extern ft_strcpy
;char *strdup(const char *str);

section .text
	global ft_strdup

	; call strlen et strcpy ?
	ft_strdup:
		;str = rdi
		call ft_strlen ;arg in rdi
		; len is in rax
		inc rax ; len + 1 pour malloc
		call malloc wrt ;arg in rdi 
		; allocated address in malloc
