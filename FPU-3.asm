BITS 32
section .text 

global iloczyn_skalarny
 
iloczyn_skalarny:
push   ebp
mov    ebp, esp 
push ebx
push ecx           

%define n dword [ebp+8]
%define x dword [ebp+12] 
%define y dword [ebp+16]


mov ebx, x
mov edx, y
mov ecx, n
mov eax, 0
finit
fldz
loop:
  fld tword [ebx + eax]
  fld tword [edx + eax]
  fmulp st1
  faddp st1
  add eax, 12
  loop loop

pop ecx
pop ebx
leave
ret
