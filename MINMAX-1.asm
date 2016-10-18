section .text
global minmax
minmax:
sub esp, 8
mov [esp], ebx
mov [esp + 4], edi

mov edi, [esp + 12]
mov ecx, [esp + 16]

mov ebx, [ecx]
mov edx, [ecx]

loop:
  PREFETCHT0 [ecx + 4 * edi - 64]
  mov eax, [ecx + 4 * edi - 4]
  cmp eax, ebx
  cmovg ebx, eax
  cmp eax, edx
  cmovl edx, eax
  sub edi, 1
  jnz loop

mov eax, [esp+20]
mov ecx, [esp+24]
mov [ecx], edx
mov [eax], ebx

mov ebx, [esp]
mov edi, [esp + 4]
add esp, 8
ret
