BITS 32
segment .data
dwa dw 2
section .text 

global tablicuj
 
tablicuj:
push   ebp
mov    ebp, esp      
push ecx  

%define a qword [ebp+8]
%define b qword [ebp+16] 
%define P qword [ebp+24]
%define Q qword [ebp+32]
%define xmin qword [ebp+40]
%define xmax qword [ebp+48]
%define k dword [ebp+56]
%define wartosci dword [ebp+60]

mov ecx, k
mov eax, wartosci
mov edx, 0


finit

fild k
fld1
fsubp st1
fld xmax
fld xmin
fsubp st1
fdivrp st1

fld xmin

loop:
fld P
fild word [dwa]
fldpi
fmulp st1
fmulp st1
fmul st1
fsin
fld st0
fmulp st1
fld a
fmulp st1

fld Q
fild word [dwa]
fldpi
fmulp st1
fmulp st1
fmul st2
fsin
fld st0
fmulp st1
fld b
fmulp st1
faddp st1

fstp qword [eax + edx]

fadd st1

add edx, 8
loop loop

;fstp qword [ebp - 8]
;fstp qword [ebp - 8]

pop ecx
leave
ret
