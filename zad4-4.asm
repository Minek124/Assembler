%include "asm64_io.inc"

BITS 64
segment .data
tab db "0123456789ABCDEF" 
spacje db 0,"       "  ; ????
segment .bss
segment .text
global asm_main 
asm_main:

;...

push 0xABC012   ; signed dword immediate exceeds bounds
push ret1
jmp konwertuj

ret1:
mov rax, rsp
call println_string
add rsp, 16*8
ret

konwertuj:
  mov rdi, [rsp]
  mov rax, [rsp + 8]
  add rsp, 16
  mov rcx, 15
  mov rdx, [spacje]
  push 0
  loop:
    mov rbx, rax
    and rbx, 0xF
    mov bl, [tab + rbx]
    dump_regs 1
    or rbx, rdx
    push rbx
    shr rax, 4
    loop loop
  jmp rdi


