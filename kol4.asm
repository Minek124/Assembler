segment .data
  one dd 1.0,1.0,1.0,1.0
  x dd 0,0,0,0
segment .bss
section .text 
global oblicz

oblicz:
push rbp
mov rbp, rsp

;rdi wynik
;rsi n
;rdx a
movss [x], xmm0
movss [x + 4], xmm0
movss [x + 8], xmm0
movss [x + 12], xmm0

test rsi, rsi ; n = 0 
jz end

xor rax, rax
movups xmm1, [x]  ; x
movups xmm2, [x]  ; x + 1
movups xmm3, [one] 
addps xmm2, xmm3
movups xmm3, xmm1 ; x

loop:
  movups xmm0, [rdx + 4 * rax]
  movups xmm1, xmm3
  subps xmm1, xmm0
  mulps xmm1, xmm2
  movups [rdi + 4 * rax], xmm1
  add rax, 4
  cmp rax, rsi
  jl loop

end:

pop rbp
ret

