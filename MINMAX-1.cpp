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
#include <time.h>
#include <stdlib.h>

using namespace std;
extern "C" void minmax(int n, int * tab, int * max, int * min);

int main(){
   srand (time(NULL));
   const int rozmiar = 100001;
   const int liczba_powtorzen = 10000; 
   int tab[rozmiar] = {777, 3, 3, -5, -9, 123, 4, 32, 666, 22, 11, 32, 44, 12, 324, 43}; 
   tab[rozmiar-1] = -1000;
   tab[rozmiar-2] = -77;
   int min, max;
   clock_t start, stop;
   start = clock();
   //for(int i=0; i<rozmiar; i++){
   //   tab[i] = rand()%10000;
   //}
   for(int i=0; i<liczba_powtorzen; i++){
      minmax(rozmiar, tab, &max, &min);
   }
   printf("min = %d    max = %d\n", min, max); 
   stop = clock();
   printf("\n time = %f  ( %d cykli)\n", (stop - start)*1.0/CLOCKS_PER_SEC, ((int)(stop - start)));
   return 0;
}
