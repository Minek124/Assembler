%include "asm64_io.inc"

segment .data
pytanie db "Podaj przedzial jako dwie liczby : ", 0  ; tekst musi kończyć się zerem
segment .bss

segment .text
global asm_main
asm_main:
 enter 0,0 
; ----

mov rax, pytanie
call print_string

call read_int
mov ebx, eax

call read_int
mov edi, eax

petla1:
  
  cmp rbx, rdi
  ja koniec
  mov rcx, 2

  petla:
    mov rax, rbx
    mov rdx, 0 
    div rcx
    cmp rdx, 0 
    jz nie_pierwsza
    inc rcx
    cmp rcx, rax
    jl petla

  mov rax, rbx
  call println_int
  inc rbx
  jmp petla1

  nie_pierwsza:
  inc rbx
  jmp petla1

koniec:

; ---
mov rax, 0 ; powrót do C
leave
ret
