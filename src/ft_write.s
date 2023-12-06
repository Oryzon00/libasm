bits 64

; ssize_t write(int fd, const void *buf, size_t count);

extern __errno_location

section .text
	global ft_write

	ft_write:
		mov rax, 1 ;syscall write
		syscall
		cmp rax, 0
		jl _handle_error
		ret

	_handle_error:
		neg rax
		push rax
		call __errno_location wrt ..plt
		pop r12
		mov [rax], r12
		mov rax, -1
		ret
