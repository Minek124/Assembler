%include "asm64_io.inc"
segment .data
dwa dq 2.0
text db "Faktura %d : obrot %f podatek %f", 10, 0
segment .bss
podatek1: resq 1	
obrot: resq 1
section .text 

global podatek
global wypisz
extern printf 
 
podatek:

mov [rsp - 8], rdi
movss xmm1, [rsp - 4]
subss xmm1, xmm0
movups [rsp - 16], xmm0
movss xmm0, [rsp - 12]
mulss xmm0, xmm1
ret


wypisz:

push rbp
mov rbp, rsp

movq xmm0, [rdi + 8]
mov rdi, [rdi]

call podatek

movss [rsp - 4], xmm0
fld	dword [rsp - 4]
fstp qword [podatek1]
movq xmm1, [podatek1]


mov [rsp - 8], rdi

fld dword [rsp - 4]
fstp qword [obrot]
movq xmm0, [obrot]

mov esi, [rsp - 8]

mov rax, 2
mov rdi, text

call printf
pop rbp
ret
