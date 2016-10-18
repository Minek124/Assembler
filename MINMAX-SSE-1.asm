section .text
global minmax
minmax:
sub esp, 16
mov [esp], ebx
mov [esp + 4], edi
mov [esp + 8], esi
mov [esp + 12], ebp

mov ebx, [esp + 20]
mov esi, [esp + 24]

mov ecx, 1

mov edi, [esi]
mov edx, [esi]


lddqu xmm0, [esi]
lddqu xmm1, [esi]
loop:
  lddqu xmm2, [esi+ecx*4]
  add ecx, 4
  pminsd xmm0, xmm2
  pmaxsd xmm1, xmm2
  cmp ecx, ebx
  jl loop


movups [esp - 32], xmm0
movups [esp - 16], xmm1

mov edi, [esp - 32]
mov edx, [esp - 16]

cmp edi, [esp - 28]
cmovg edi, [esp - 28]
cmp edi, [esp - 24]
cmovg edi, [esp - 24]
cmp edi, [esp - 20]
cmovg edi, [esp - 20]

cmp edi, [esp - 12]
cmovl edi, [esp - 12]
cmp edi, [esp - 8]
cmovl edi, [esp - 8]
cmp edi, [esp - 4]
cmovl edi, [esp - 4]

mov eax, [esp+28]
mov ecx, [esp+32]
mov [ecx], edx
mov [eax], edi


mov ebx, [esp]
mov edi, [esp + 4]
mov esi, [esp + 8]
mov ebp, [esp + 12]
add esp, 16
ret
