section .text
global sortuj
sortuj:
sub esp, 8
mov [esp], edi
mov [esp + 4], esi

mov edx, [esp + 12]
mov esi, [esp + 16]
lea edi, [esi + 4*edx - 4]

call qs

mov edi, [esp]
mov esi, [esp + 4]
add esp, 8
ret

qs:
  cmp esi, edi
  jge end
  sub esp, 12
  mov [esp], esi
  mov [esp + 4], edi
 
  movss xmm0, [edi]
  mov ecx, esi
  loop:
    movss xmm1, [esi]
    comiss xmm1, xmm0
    ja skok
    mov eax, [ecx]
    mov [esi], eax
    movss [ecx], xmm1
    add ecx, 4
    skok:
    add esi, 4
    cmp esi, edi
    jl loop
  
  mov eax, [ecx]
  mov edx, [edi]

  mov [edi], eax
  mov [ecx], edx
  
  mov edi, ecx
  mov esi, [esp]
  mov [esp + 8], ecx
  sub edi, 4
  call qs

  mov esi, [esp + 8]
  mov edi, [esp + 4]
  add esi, 4
  call qs

  add esp, 12
  end:
ret
