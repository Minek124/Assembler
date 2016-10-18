BITS 32
section .text 

global oblicz
 
oblicz:
push   ebp
mov    ebp, esp 
push ecx           

%define a dword [ebp+8]
%define b dword [ebp+12] 
%define x qword [ebp+16]
%define n dword [ebp+24]

finit
fld a
fld x
fmulp st1
fld b
fld x
fmulp st1
faddp st1

fld st0
mov ecx, n
sub ecx, 1

loop:
  fmul st1
  loop loop


pop ecx
leave
ret
