%include "asm64_io.inc"

segment .data

segment .bss
tab resd 5

segment .text

global asm_main
asm_main:
 enter 0,0 
; ----

call read_int
mov esi, eax

mov ecx, esi
mov ebx, tab
.loop:
  call read_int
  mov [ebx], eax
  add rbx, 4
  loop .loop

mov ecx, esi
mov ebx, tab
mov eax, 1

.loop2:
  imul dword [ebx]
  add ebx, 4
  loop .loop2

call println_int

; ---
mov rax, 0 ; powrót do C
leave
ret
