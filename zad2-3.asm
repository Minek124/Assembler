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
mov r8, rax

call read_int
mov r9, rax

mov rbx, r8
mov rcx, r9

petla:
  test rcx, rcx
  jz koniec
  mov rdi, rcx
  mov rdx, 0
  mov rax, rbx
  div rcx
  mov rcx, rdx
  mov rbx, rdi
  jmp petla
  

koniec:
  mov rdx, 0
  mov rax, r8
  mul r9
  mov rdx, 0
  div rbx
  
  call println_int

; ---
mov rax, 0 ; powrót do C
leave
ret
