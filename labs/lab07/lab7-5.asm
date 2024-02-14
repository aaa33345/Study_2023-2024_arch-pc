%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите a: ',0h
msg3 db 'Введите C: ',0h
msg4 db "Наибольшее число: ",0h

section .bss
x resb 10
a resb 10
;C resb 10
max resb 10


section .text
global _start
_start:




mov eax,msg1
call sprint

mov ecx,x
mov edx,10
call sread

mov eax,x
call atoi 
mov [x],eax






mov eax,msg2
call sprint

mov ecx,a
mov edx,10
call sread

mov eax,a
call atoi 
mov [a],eax





;mov eax,msg3
;call sprint

;mov ecx,C
;mov edx,10
;call sread

;mov eax,C
;call atoi 
;mov [C],eax



 

mov ecx,[a] 
mov [max],ecx 

cmp ecx,[0] 
je check_B 
jmp check_A




check_B:


mov ecx,[max]
mov eax,ecx
mov eax,x
mov ebx,[2]
mul ebx
add eax,[a]
mov [max],eax
jmp fin 
;mov ecx,[B] 
;mov [max],ecx


check_A:

mov ecx,[max]
mov eax,ecx
mov eax,x
mov ebx,[2]
mul ebx
add eax,[1]
mov [max],eax
jg fin 
;mov ecx,[B] 
;mov [max],ecx





fin:
mov eax, msg4
call sprint 
mov eax,[max]
call iprintLF 
call quit 
