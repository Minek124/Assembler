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

using namespace std;

unsigned int rotate(unsigned int x, int n = 1);

unsigned char rotate(unsigned char x, int n = 1);

int main(){
  unsigned int a = 4;
  unsigned char b = 1;
  cout << rotate(a, 3) << endl;
  cout <<(unsigned int) rotate(b, 2) << endl;
  return 0;
}
