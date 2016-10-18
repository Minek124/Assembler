; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 hello.asm -o hello.o
; linkowanie: ld hello.o -o hello
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text            ; początek sekcji kodu.

global _start            ; linker ld domyślnie rozpoczyna
                         ; wykonywanie programu od etykiety _start
                         ; musi ona być widoczna na zewnątrz (global)
_start:                   ; punkt startu programu
  
  mov     rax, 0          ; numer funkcji systemowej:
  mov     rdi, 0          ; numer pliku, do którego piszemy.
  mov     rsi, x
  mov     rdx, 2
  syscall

  mov     rax, 0          ; numer funkcji systemowej:
  mov     rdi, 0          ; numer pliku, do którego piszemy.
  mov     rsi, y
  mov     rdx, 2
  syscall

  mov al, [x]
  sub al, '0'

  mov bl, [y]
  sub bl, '0'

  add al, bl

  mov bl, 10
  div bl
  
  add ah, '0'
  add al, '0'
  mov [wynik], al
  mov [wynik+1], ah
  
  mov     rax, 1          ; numer funkcji systemowej:
  mov     rdi, 1          ; numer pliku, do którego piszemy.
  mov     rsi, wynik      ; RSI = adres tekstu
  mov     rdx, 3          ; RDX = długość tekstu
  syscall                 ; wywołujemy funkcję systemową

  mov     rax, 60         ; numer funkcji systemowej
  syscall                 ; wywołujemy funkcję systemową

section .data                   ; początek sekcji danych.
  x db "5"
  y db "3"
  wynik db "xx",0xA
