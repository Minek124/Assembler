%include "asm64_io.inc"
segment .data

segment .bss

section .text 

global gradientSSE
 
gradientSSE:
push rbp
mov rbp, rsp

mov rax, rdx
sub rax, 4
and rax, -3
mov rcx, 0

lea r8, [rsi + 4 * rdx] 

xor r9, r9
sub r9, rdx

lea r9, [rsi + 4 * r9]

loop: 
  movups xmm0, [rsi + rcx*4 + 4]
  movups xmm1, [rsi + rcx*4 - 4]
  subps xmm0, xmm1
  mulps xmm0, xmm0

  movups xmm1, [r8 + rcx*4]
  movups xmm2, [r9 + rcx*4]
  subps xmm1, xmm2
  mulps xmm1, xmm1

  addps xmm0, xmm1
  sqrtps xmm0, xmm0

  movups [rdi+rcx*4], xmm0
   
  add rcx, 1
  cmp rcx, rax
  jl loop

pop rbp
ret

