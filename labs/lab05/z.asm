GLOBAL _start
_start:
    push    rdx
    push    rcx
    push    rbx
    push    rax
    
    
    mov     rdx, rax
    pop     rax
    
    mov     rcx, rax
    mov     rbx, 1
    mov     rax, 4
    int     80h

    pop     rbx
    pop     rcx
    pop     rdx
    ret
