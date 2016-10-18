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

extern "C" void prostopadloscian( float a, float b, float c, float * objetosc, float * pole);


int main()
{
  float obj = -1;
  float pole = -1;
  prostopadloscian(3, 4, 5, &obj, &pole);
  std::cout << obj << "\n";
  std::cout << pole << "\n";
  return 0;
}

