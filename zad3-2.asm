%include "asm64_io.inc"

segment .data
tab db "abcdefge", 0
dlugosc equ $ - tab

segment .bss

segment .text

global asm_main
asm_main:
 enter 0,0 
; ----


mov ecx, 0
mov ebx, tab
mov edx, 'g'
mov rsi, -1
loop:
  mov al, [ebx]
  cmp eax, edx
  jne nie_jest
  mov esi, ebx
  sub esi, tab
  nie_jest:
  inc ecx
  add ebx, 1
  test eax, eax
  jnz loop

mov eax, ecx
dec eax
call println_int
mov eax, esi

call println_int

; ---
mov rax, 0 ; powrót do C
leave
ret
