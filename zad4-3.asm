%include "asm64_io.inc"

BITS 64
segment .data
tab dd 1,2,3,4,5,77,7,8,9,10
ilosc equ ($-tab)/4

segment .bss

segment .text
global asm_main 
asm_main:

;...

push ilosc
push tab
call maximum

call println_int

ret


maximum:
  mov ebx, [rsp + 8]
  mov ecx, [rsp + 16]
  mov eax, -999999
  loop:
    mov edx, [ebx + 4*ecx - 4]
    cmp edx, eax
    jl skok
    mov eax, edx
    skok:
    loop loop  
  ret 16


