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

int suma (int *a, int b);         /* prototyp funkcji */

int main()
{
      int tab[999];
      int i = 0;
      while(1){
        int x;
	    scanf("%d", &x);
        if(x == 0)
          break;
        tab[i++] = x;
      }  
      printf("%d\n", i);
      printf("%d\n", suma(tab,i));
      return 0;
}
