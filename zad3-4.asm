%include "asm64_io.inc"

segment .data

segment .bss

x resb 100
s1 resb 100
s2 resb 100

segment .text

global asm_main
asm_main:
 enter 0,0 
; ----


mov     rax, 0          
mov     rdi, 0          
mov     rsi, s2
mov     rdx, 99
syscall

mov r10, rax

mov     rax, 0          
mov     rdi, 0          
mov     rsi, s1
mov     rdx, 99
syscall


mov     rax, 0          
mov     rdi, 0          
mov     rsi, x
mov     rdx, 99
syscall

mov r9, x
mov r8, 0
loop:
mov ebx, s1
mov r8b, [r9]
test r8b, r8b
jz koniec
mov ecx, r10d
loop2:
  mov al, [ebx]
  inc ebx
  cmp al, r8b
  jne found
    dec ebx
    add ebx, 100
    mov dil, [ebx]
    mov byte [r9], dil
    ;dump_regs 1
    jmp jump
  found:  
    
  loop loop2
jump:
inc r9
jmp loop

koniec:

mov rax, x
call println_string

; ---
mov rax, 0 ; powrót do C
leave
ret
