%include "asm64_io.inc"
segment .data

segment .bss

section .text 

global _Z6kopiujPiS_j
global _Z5zerujPij
 
_Z6kopiujPiS_j
push rbp
mov rbp, rsp

CLD
.loop:
  movsd
  sub rdx, 1
  jnz .loop

pop rbp
ret


_Z5zerujPij:

push rbp
mov rbp, rsp

CLD
xor rax, rax
.loop:
  stosd
  sub rsi, 1
  jnz .loop

pop rbp
ret
