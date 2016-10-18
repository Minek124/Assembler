segment .data

section .text 

global wartosc
 
wartosc:
push   rbp
mov    rbp, rsp      

; a*x + b

mulsd xmm0, xmm2
addsd xmm0, xmm1


leave
ret
