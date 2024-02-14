%define __NR_read 0
%define __NR_write 1
%define __NR_exit 60
 
GLOBAL  _start
 
SECTION .bss
 
%define bufsize 1024
buffer  resb    bufsize
 
SECTION .text
 
_start:
 
        mov     rax,__NR_read   ; "read" function number
        xor     rdi,rdi         ; console read file descriptior (0)
        mov     rsi,buffer      ; buffer address
        mov     rdx,bufsize     ; buffer size
        syscall                 ; read from console (returns read bytes count in rax)
 
        mov     rdx,rax         ; number of bytes to write
        mov     rax,__NR_write  ; "write" function number
        mov     rdi,1           ; console write file descriptior
        ; buffer address (rsi) is not changed
        syscall                 ; write to console
 
        mov     rax,__NR_exit   ; "exit" function number
        xor     rdi,rdi         ; error code (0)
        syscall                 ; terminate the program

