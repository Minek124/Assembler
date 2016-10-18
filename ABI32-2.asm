BITS 32
section .text 

global suma        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma
 
suma:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp            

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.


%idefine    tab    [ebp+8]
%idefine    n    [ebp+12]

; tu zaczyna się właściwy kod funkcji

mov    ecx, n
mov    esi, tab
mov    eax, 0

loop:
  mov edx, [esi + 4 * ecx - 4]
  add eax, edx
  loop loop

; tu kończy się właściwy kod funkcji

leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
