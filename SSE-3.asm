segment .data
  four dd 4.0
  four2 dd 4.0
  four3 dd 4.0
  four4 dd 4.0
segment .bss

section .text 

global scaleSSE
 
scaleSSE:
push rbp
mov rbp, rsp

; rdi out
; rsi in
; rdx n

and rdx, -3
mov rcx, 0
mov rax, 0

lea r8, [rsi + 4 * rdx] 

movups xmm4, [four]

loop: 
  movups xmm0, [rsi + rcx*4]
  movups xmm1, [r8 + rcx*4]
  movups xmm2, [rsi + rcx*4 + 16]
  movups xmm3, [r8 + rcx*4 + 16]

  addps xmm0, xmm1
  addps xmm2, xmm3
  haddps xmm0, xmm2
  
  divps xmm0, xmm4

  movups [rdi + rax*4], xmm0
   
  add rcx, 8
  add rax, 4

  cmp rcx, rdx
  jl loop

pop rbp
ret

