; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 hello.asm -o hello.o
; linkowanie: ld hello.o -o hello
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text            ; początek sekcji kodu.

global _start            ; linker ld domyślnie rozpoczyna
                         ; wykonywanie programu od etykiety _start
                         ; musi ona być widoczna na zewnątrz (global)
_start:                   ; punkt startu programu
  
  mov     rax, 2          ; numer funkcji systemowej:
  mov     rdi, nazwa          ; numer pliku, do którego piszemy.
  mov     rsi, 101o      ; RSI = adres tekstu
  mov     rdx, 777o          ; RDX = długość tekstu
  syscall                 ; wywołujemy funkcję systemową

  mov	  rdi, rax

  mov     rax, 1          ; numer funkcji systemowej:
  mov     rsi, x      ; RSI = adres tekstu
  mov     rdx, 7          ; RDX = długość tekstu
  syscall

  mov     rax, 3          ; numer funkcji systemowej:
  syscall                 ; wywołujemy funkcję systemową

  mov     rax, 60         ; numer funkcji systemowej
  syscall                 ; wywołujemy funkcję systemową

section .data                   ; początek sekcji danych.
  nazwa db "xxx.txt",0
  x db "testxx", 0xA
