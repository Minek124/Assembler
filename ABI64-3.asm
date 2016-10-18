segment .data
dwa dw 2
section .text 

global iloczyn
 
iloczyn:
pop r10     
push r9
push r8
push rcx
push rdx
push rsi


mov rcx, 0
mov rax, 1
loop:
  mov rdx, [rsp + 8*rcx]
  mul rdx
  add rcx, 1
  cmp rcx, rdi
  jl loop

add rsp, 40
push r10
ret
