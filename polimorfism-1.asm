section .data
  pretab dq 0,0
  tab dq 0,0,0,0,0
global zmien


zmien:
push rbp
mov rbp, rsp
mov rax, rdi
mov qword [tab], nowa_funkcja
mov qword [rax], tab

;mov rax, [rax]
;mov rdx, [rax]
;mov qword [rax], nowa_funkcja

pop rbp
ret

nowa_funkcja:
  push rbp
  mov rbp, rsp
  mov rax, rsi
  sub rax, 1
  pop rbp
ret
