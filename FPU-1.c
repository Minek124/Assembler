// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 suma.asm -o suma.o
// gcc -m32 -o main.o -c main.c
// gcc -m32 main.o suma.o -o suma
// 
// WINDOWS :
// nasm -fcoff suma.asm -o suma.obj
// gcc -o main.obj -c main.c
// gcc main.obj suma.obj -o suma.exe
#include <iostream>

extern "C" double wartosc(double a, double b, double c, double d, double x);

int main()
{
  std::cout << (wartosc(2, 3, 4, 5, 1.)) << "\n";
  std::cout << (wartosc(2, 3, 4, 5, -1.)) << "\n";
  return 0;
}
/* Wyjście:
 * 14
 * 2
 */ 
