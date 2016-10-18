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

typedef struct{
    int min;
    int max;
} MM;

MM minmax( int N, ...);

int main(){
   MM wynik = minmax(5, -5, -2, 4 , 90, 111);
   printf("min = %d, max = %d \n", wynik.min, wynik.max);
   return 0;
}
