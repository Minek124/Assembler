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
#include <iostream>
#include <cstdio>
#include <stdlib.h>
#include <time.h>
extern "C" void solve(int n, float * A, float * B, float * X);
using namespace std;
int main(void)
{
  #define N 88884
  float a[N] = {0,0,-1, 1,-3,-2,9};
  float b[N] = {1,0, 0,-1, 6, 6,1};
  float x[N] = {99,99,99,99};
  clock_t start, stop;
  start = clock();
  for(int i = 0;i< 10000;i++)
  	solve(N,a,b,x);
  stop = clock();
  printf("\n time = %f  ( %d cykli)\n", (stop - start)*1.0/CLOCKS_PER_SEC, ((int)(stop - start)));
  for(int i = 0;i<10;i++)
    cout << x[i] <<endl;
           
}
