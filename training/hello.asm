bits 64


section .data
	message: db "Hello world!", 10
	msg_len: equ  $-message

section .text
	global _start
	_start:
		mov rax, 1			;syscall write
		mov rdi, 1
		mov rsi, message
		mov rdx, msg_len
		syscall

		mov rax, 60			;syscall exit
		mov rdi, 0			;xor rdi, rdi
		syscall

; ---------------------------------------------------------------------------------------------

; Structure of a nasm program

;	section .data	--> initialized data	--> d : define/declare	(static data for the program)
;	section .bss	--> uninitialized data	--> res : reserve		(static data for the program)
;	section .text	--> code

; bss -> Block Starting Symbol
; label are pointer to the first byte of the data array --> Ex: message

; ---------------------------------------------------------------------------------------------

; xor rdi, rdi	--> 1 opcode
; mov rdi, 0	--> 2 opcode

; $ --> current location (adress of the assembler)
; msg_len: equ  $-message --> create label equal to curretn address - address of label "message"

; times x --> repeat instruction x times ex: msg: times 100 db 0 (100 byte with value 0)

; ---------------------------------------------------------------------------------------------

; String constant 
; dx -> declare type x
; b -> byte			= 1 byte	( 8 bits  )
; w -> word			= 2 bytes	( 16 bits )
; d -> double		= 3 bytes	( 32 bits )
; q -> quadruple	= 4 bytes	( 64 bits )

; ---------------------------------------------------------------------------------------------

; mov <register>, <value> / <register>	--> move (put in)
; equ <value>							--> equal

; xor <register>, <value> / <register>	--> ou exclusif (false si same value)

; cmp <value1> <value2>					--> compare
; jmp <label>							--> jump to label

; je --> jump if A equal B ( A == B )
; jne --> jump if A not equal B ( A != B )

; jg --> jump if A greater than B ( A > B )
; jl --> jump if A lesser than B ( A < B )

; jge --> jump if A greater or equal than B ( A >= B )
; jle --> jump if B lesser or equal than B ( A <= B )

; ---------------------------------------------------------------------------------------------

; <Etiquette / label>:
; 	<instruction> <operand(s)>
; 	<instruction> <operand(s)>
; 	<instruction> <operand(s)>

; ---------------------------------------------------------------------------------------------

; Directives
; Ex: bits 64, global, section, extern
; section == segment

; ---------------------------------------------------------------------------------------------

; nasm -f elf64 -o hello.o hello.asm
; ld -o hello hello.o
; ./hello
