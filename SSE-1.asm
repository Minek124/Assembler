%include "asm64_io.inc"
segment .data

segment .bss

section .text 

global diff
 
diff:
push rbp
mov rbp, rsp

mov rax, rcx
and rax, -3
mov rcx, 0

loop: 
  lddqu xmm0, [rsi+rcx]
  lddqu xmm1, [rdx+rcx]
  PSUBSB xmm0, xmm1
  movdqu [rdi+rcx], xmm0
   
  add rcx, 16
  cmp rcx, rax
  jl loop

pop rbp
ret

