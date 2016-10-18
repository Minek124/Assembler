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
#include <stdio.h>

int sortuj (int *a, int *b, int *c);         /* prototyp funkcji */

int main()
{
      int x=5, y=3, z=4;
      sortuj( &x, &y, &z);
      printf(" %d %d %d \n", x, y, z);
      return 0;
}
