BITS 32
segment .data
dwa dw 2
section .text 

global prostopadloscian
 
prostopadloscian:
push   ebp
mov    ebp, esp            

%define a dword [ebp+8]
%define b dword [ebp+12] 
%define c dword [ebp+16]
%define obj dword [ebp+20]
%define pole dword [ebp+24]

fld a 
fld b
fld c
fmulp st1
fmulp st1

mov eax, obj
fstp dword [eax]

fild word [dwa]
fld a
fld b
fmulp st1
fmulp st1

fild word [dwa]
fld a
fld c
fmulp st1
fmulp st1

fild word [dwa]
fld b
fld c
fmulp st1
fmulp st1

faddp st1
faddp st1

mov eax, pole
fstp dword [eax]

leave
ret
