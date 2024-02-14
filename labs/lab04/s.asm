section .data
	hello db "Hello, Word!",10
	helloLen:  equ $-hello
	helloo db "Helloo, Word!",10
	hellooLen:  equ $-helloo
    hh: db 5,10
    hhLen: equ $-hh





GLOBAL _start


_start:
	mov rax, 1
        mov rdi, 1
        mov rsi, hello
        mov rdx, helloLen
	syscall

	mov rax, 1
     
        mov rdi, 1
        mov rsi, [hh]
        mov rdx, hhLen
	syscall

        mov rax, 60
        mov rdi, 0
	syscall


