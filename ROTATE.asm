%include "asm64_io.inc"
segment .data

segment .bss

section .text 

global _Z6rotateji
global _Z6rotatehi
 
_Z6rotateji:
push rbp
mov rbp, rsp

mov rcx, rsi
ror edi, cl
mov rax, rdi

pop rbp
ret


_Z6rotatehi:

push rbp
mov rbp, rsp

mov rcx, rsi
ror dil, cl
mov al, dil

pop rbp
ret
