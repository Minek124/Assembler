%include "asm64_io.inc"

segment .data
tab db "1234560", 0
dlugosc equ $ - tab

segment .bss

tab2 resb 100

segment .text

global asm_main
asm_main:
 enter 0,0 
; ----

jmp funkcje

f1:
  mov ebx, eax
  mov eax, 0
  mov edi, 0
  mov ecx, 10
  loop:
  mov edx, 0
  mov byte dil, [ebx]
  sub dil, '0'
  cmp dil, 0
  je .koniec
  mul ecx 
  add eax, edi
  add ebx, 1  
  jmp loop

  .koniec:
  ret

f2:
  mov ebx, tab2
  mov ecx, 80000000h
  mov edx, eax
  and eax, ecx
  mov eax, edx
  jz .znak
    mov byte [ebx], '-'
    inc ebx
    mov eax, edx
    and eax, 7FFFFFFFh
    mov edx, 80000000h
    sub edx, eax
    mov eax, edx
  .znak:
    .loop:
    mov edx, 0
    mov ecx, 10
    idiv ecx
    add edx, '0'
    mov byte [ebx], dl
    inc ebx
    test eax, eax
    jz .koniec
    jmp .loop

  .koniec:
  mov byte [ebx], 0
  
  mov eax, tab2
  ret

funkcje:

mov eax, tab
call f1
call println_int


mov rax, -123456
call f2

call println_string

; ---
mov rax, 0 ; powrót do C
leave
ret
