;nasm 2.11.08
 
section .data
    msg db  "z="
    point db "."
    lensp equ $ - point
    lens equ $ - msg-1
    x db 5
    y db 4
section .bss
    temp       resb 4
    s          resb 1024
    len        resd 1
section .text
    global _start
 
_start:
    mov     eax, 0
    mov     ebx, 0
    mov     ecx, 0
    mov     edx, 0
 
    xor     bx, bx  ; bx = 0
    mov     bl, [x]
    mov     al, [y]
    mul     bl      ; ax = x*y
    add     bx, ax  ; bx = x*y+x
    sub     bl, [y] ; bx = x*y+x-y
    sbb     bh, 0
    xor     dx, dx  ; dx = 0
    xor     ax, ax  ; ax = 0
    mov     al, [x]
    div     bx      ; z ax=результат, dx=остаток
    mov esi, eax
 
 
    imul  edx,100     ; DX = 500 (остаток х10)
    xchg  eax,edx    ; AX = 500
    and   edx,0      ; DX = 0
    div   ebx        ; AX = 500/17 = 29
    pop   rbx       ;
    xchg  eax,edx    ; DX = 29, AX = 0
    mov [temp], edx
 
    
    mov     ecx, msg
    mov     edx, lens
    mov     ebx, 1
    mov     eax, 4
    int     0x80
 
 
 
    mov eax, esi
    lea edi, [s]
    xor ecx, ecx
    mov ebx, 10
    .div1:
        xor edx, edx
        inc ecx
        div ebx
        add edx, '0'
        push rdx
        test eax, eax
    jnz .div1
    mov [len], ecx
    .store1:
        pop rax
        stosb
    loop .store1
    
    mov eax, 4
    mov ebx, 1
    mov ecx, s
    mov edx, [len]
    int 80h
    
    
    
    mov     ecx, point
    mov     edx, lensp
    mov     ebx, 1
    mov     eax, 4
    int     0x80
 
    mov eax, [temp]
    lea edi, [s]
    xor ecx, ecx
    mov ebx, 10
    .div:
        xor edx, edx
        inc ecx
        div ebx
        add edx, '0'
        push rdx
        test eax, eax
    jnz .div
    mov [len], ecx
    .store:
        pop rax
        stosb
    loop .store
    
    mov eax, 4
    mov ebx, 1
    mov ecx, s
    mov edx, [len]
    int 80h
    
 
    mov eax,1            
    mov ebx,0            
    int 80h;
