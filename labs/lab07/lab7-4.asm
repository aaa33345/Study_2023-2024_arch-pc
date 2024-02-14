%include 'in_out.asm'
section .data
msg1 db 'Введите a: ',0h

msg2 db 'Введите x: ',0h

msg3 db '=: ',0h



section .bss
A resb 10
X resb 10




section .text
global _start
_start:




mov eax,msg1
call sprint


mov ecx,A
mov edx,10
call sread

mov eax,A
call atoi 
mov [A],eax


    

mov eax,msg2
call sprint


mov ecx,X
mov edx,10
call sread

mov eax,X
call atoi 
mov [X],eax

mov ecx,[A] 


cmp ecx,0

je pr2
jmp pr1



pr1:


mov eax,[X]
mov ebx,2
mul ebx  
add eax,[A]


;mov eax, msg3
;call sprint 

call iprintLF 
call quit 



pr2:

mov eax,[X]
mov ebx,2
mul ebx  
add eax,1

;mov eax, msg3
;call sprint 
call iprintLF 
call quit 





