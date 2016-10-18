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
#include <cstdio>
#include <stdlib.h>
#include <time.h>

using namespace std;

const int rozmiar = 10000;
float tab[rozmiar];

extern "C" void sortuj(int n, float * tab);   
   
int main(){
    int seed=1, coile=1;
    srand(seed);
    for(int i=0; i<rozmiar; i++){
       tab[i] = rand()/(rand()+1.0e-14);
    }
    tab[0] = 11000;
    tab[rozmiar - 1] = -1000;
    tab[rozmiar - 2] = -77;
    tab[rozmiar - 3] = -88;
    clock_t start, stop;
    start = clock();
    sortuj(rozmiar, tab);
    stop = clock();
    for(int i=0; i<5; i+=coile){
       printf("%20.16f\n",tab[i]);
    }
    for(int i=rozmiar - 5; i<rozmiar; i+=coile){
       printf("%20.16f\n",tab[i]);
    }
    printf("\n time = %f  ( %d cykli)\n", (stop - start)*1.0/CLOCKS_PER_SEC, ((int)(stop - start)));
    return 0;
}
