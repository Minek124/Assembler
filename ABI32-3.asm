BITS 32
section .text 

global sortuj        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
sortuj:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp          

push ebx
push ecx
push esi
push edi  

%idefine    a    [ebp+8]
%idefine    b    [ebp+12]
%idefine    c    [ebp+16]

mov    eax, a
mov    ebx, b
mov    ecx, c

mov    eax, [eax]
mov    ebx, [ebx]
mov    ecx, [ecx]

cmp eax, ebx
jl skok
mov edx, eax
mov eax, ebx
mov ebx, edx
skok:

cmp eax, ecx
jl skok2
mov edx, eax
mov eax, ecx
mov ecx, edx
skok2:

cmp ebx, ecx
jl skok3
mov edx, ebx
mov ebx, ecx
mov ecx, edx
skok3:

mov    edx, a
mov    esi, b
mov    edi, c

mov    [edx], eax
mov    [esi], ebx
mov    [edi], ecx

pop edi
pop esi
pop ecx
pop ebx

leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
