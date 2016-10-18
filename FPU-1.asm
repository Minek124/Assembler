BITS 32
section .text 

global wartosc
 
wartosc:
push   ebp
mov    ebp, esp            

%define a qword [ebp+8]
%define b qword [ebp+16] 
%define c qword [ebp+24]
%define d qword [ebp+32]
%define x qword [ebp+40]


;((xa + b)x + c)x + d
fld x ; 1
fld b ; 3,1
fld a ; 2,3,1
fmul st2 ; 2,3,1
faddp st1 ; 5,1
fmul st1 ; 5,1
fld c
faddp st1 ; 9,1
fmulp st1
fld d 
faddp st1


leave
ret
