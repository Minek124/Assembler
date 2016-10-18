%include "asm64_io.inc"

segment .data
sukces   db "jest pierwsza",0xA, 0
blad   db "nie jest pierwsza",0xA, 0
segment .bss

segment .text
global asm_main
asm_main:
 enter 0,0 
; ----

call read_int
mov ebx, eax
mov ecx, 1

petla:
  mov eax, ebx
  mov edx, 0 ; trzeba zerowac?
  div ecx
  test edx, edx ; czy jest zero
  jnz nie_jest_dzielnikiem
  mov eax, ecx
  call println_int
  nie_jest_dzielnikiem:
  inc ecx
  cmp ecx, ebx
  jle petla

; ---
mov rax, 0 ; powrót do C
leave
ret
