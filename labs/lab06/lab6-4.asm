%include 'in_out.asm'
SECTION .data
msg: DB '4/3(x-1)+5, x= ',0
rem: DB 'ответ: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread

mov eax,x    ; вызов подпрограммы преобразования
call atoi    ; ASCII кода в число, `eax=x`
xor edx,edx
dec eax
mov ebx,4
mul ebx
mov ebx,3
div ebx
add eax,5
mov ebx,eax
mov eax,rem
call sprint

mov eax,ebx

call iprintLF
call quit


; 4/3(𝑥 − 1) + 5   4 10
