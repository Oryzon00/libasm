bits 64

; int strcmp(const char *s1, const char *s2);
; strcmp() returns an integer indicating the result of the
;        comparison, as follows:

;        •  0, if the s1 and s2 are equal;

;        •  a negative value if s1 is less than s2;

;        •  a positive value if s1 is greater than s2.

section .text
	global ft_strcmp

	ft_strcmp:
		;rdi = s1
		;rsi = s2
		; --> rdi - rsi
		; while(s1[i] && (s1[i] == s2[i]))

		loop_start:
			cmp BYTE [rdi], 0 ;*s1 != '\0'
			je loop_end
			cmp BYTE [rsi], 0 ;*s2 != '\0'
			mov al, BYTE[rdi]
			cmp al, BYTE[rsi] ;*s1 == *s2
			jne loop_end
			inc rdi ;s1++
			inc rsi ;s2++
			jmp loop_start
		
		loop_end:
			mov rax, [rdi]
			sub rax, [rsi] ; *s1 - *s2
			ret ;return value in rax
