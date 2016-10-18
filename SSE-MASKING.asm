segment .data
  nan dd __NaN__,__NaN__,__NaN__,__NaN__
  inf dd __Infinity__,__Infinity__,__Infinity__,__Infinity__
  zero dd 0.0,0.0,0.0,0.0
segment .bss
section .text 
global solve
 
solve:
push esi
push edi

mov edx, [esp + 12]
mov esi, [esp + 16]
mov edi, [esp + 20]
mov ecx, [esp + 24]

xor eax, eax

movups xmm5, [zero]
movups xmm6, [nan]
movups xmm7, [inf]

loop: 
  movups xmm0, [esi + eax*4]
  movups xmm1, [edi + eax*4]  

  movaps xmm2, xmm0
  movaps xmm3, xmm1
  divps xmm1, xmm0

  cmpneqps xmm2, xmm5
  cmpneqps xmm3, xmm5

  por xmm3, xmm2
  
  pand xmm1, xmm2 ; zerowanie 
  pandn xmm2, xmm6
  por xmm1, xmm2 ; orowanie
  
  pand xmm1, xmm3 ; zerowanie 
  pandn xmm3, xmm7
  por xmm1, xmm3 ; orowanie
  
  movdqu [ecx + eax*4], xmm1  
  add eax, 4
  cmp eax, edx
  jl loop
pop edi
pop esi
ret

