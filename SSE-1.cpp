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

#define N 105

// na wyjściu out[i] = wiersz1[i] - wiersz2[i]
extern "C" void diff(char *out,char *wiersz1,char *wiersz2,int n);

int main(void)
{
    char Tablica[N+1],DIFF[N];
    int i;

    Tablica[0]=1;
    for(i=1;i<=N;i++) Tablica[i]=Tablica[i-1]+i;

    diff(DIFF, Tablica+1, Tablica, N);

    for(i=0;i<N;i++) printf("%d ",DIFF[i]);
    printf("\n");
    
}
