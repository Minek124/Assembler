; michal mogila

segment .data
segment .bss
section .text 

global sumuj
 
sumuj:
push rbp
mov rbp, rsp

; rdi n
; xmm0 x
; rsi wsk

mov rcx, 1

movss xmm1, [rsi]

loop: 
  movss xmm2, [rsi + rcx * 4]
  
  ; mnozenie przez stala
  mov rdx, rcx
  movups xmm3, xmm2 
  loop2: 
    addss xmm2, xmm3
    sub rdx, 1
    jnz loop2

  addss xmm1, xmm2
  add rcx, 1
  cmp rcx, rdi
  jl loop

mulss xmm0, xmm1

pop rbp
ret

