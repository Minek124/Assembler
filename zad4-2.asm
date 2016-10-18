%include "asm64_io.inc"

BITS 64
segment .data
info1 db "podawaj liczby:", 0
info2 db "podaj liczbe do porownania:", 0
segment .bss

segment .text
global asm_main 
asm_main:

;...

mov rax, info1
call println_string
push 0

loop:
call read_int
test rax, rax
jz end_loop
push rax
jmp loop

end_loop:
mov rax, info2
call println_string
call read_int
mov rdx, rax
mov rax, 0

loop2:
pop rbx
test rbx, rbx
jz end_loop2
cmp rbx, rdx
jle loop2
inc rax
jmp loop2

end_loop2:
call println_int

ret

