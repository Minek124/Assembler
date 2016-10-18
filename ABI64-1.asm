segment .data
dwa dw 2
section .text 

global iloczyn
 
iloczyn:
push   rbp
mov    rbp, rsp      


mov rcx, 0
mov eax, 1
loop:
  mov edx, [rsi + 4 * rcx]
  mul edx
  add rcx, 1
  cmp rcx, rdi
  jl loop

leave
ret
