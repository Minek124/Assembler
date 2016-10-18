%include "asm64_io.inc"

segment .data
pytanie db "Podaj dwie liczby : ", 0  ; tekst musi kończyć się zerem
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
mov ecx, 2

petla:
  mov eax, ebx
  mov edx, 0 ; trzeba zerowac?
  div ecx
  cmp edx, 0 ; zero z zerem
  jz nie_pierwsza
  inc ecx
  cmp ecx, eax
  jl petla

mov rax, sukces
call print_string
jmp koniec

nie_pierwsza:
  mov rax, blad
  call print_string

koniec:

; ---
mov rax, 0 ; powrót do C
leave
ret
