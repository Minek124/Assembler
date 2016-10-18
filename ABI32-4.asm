BITS 32
section .text 

global minmax        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
minmax:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp            
push ebx 

mov ecx, [ebp + 12]
mov ebx, 999999
mov edx, -999999
loop:
  mov eax, [ebp + 4*ecx + 12]
  cmp eax, ebx
  jg wieksze
  mov ebx, eax
  wieksze:
  cmp eax, edx
  jl mniejsze
  mov edx, eax
  mniejsze:
  loop loop

mov eax, [ebp + 8]
mov [eax], ebx
mov [eax + 4], edx


pop ebx
leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
