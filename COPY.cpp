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

// kopiuje n liczb typu int z zrodla do celu 
void kopiuj(int * cel, int * zrodlo, unsigned int n);

// zeruje tablice liczb typu int o rozmiarze n
void zeruj(int * tablica, unsigned int n);

int main(){
  int tab[] = {1, 2, 3, 4, 5};
  int tab2[] = {6, 7, 8, 9, 10};
  
  for(int i = 0; i< 5; ++i) 
    cout << tab[i] << endl;
  endl(cout);
  for(int i = 0; i< 5; ++i) 
    cout << tab2[i] << endl;

  kopiuj(tab, tab2, 5);

  for(int i = 0; i< 5; ++i) 
    cout << tab[i] << endl;
  endl(cout);
  for(int i = 0; i< 5; ++i) 
    cout << tab2[i] << endl;

  zeruj(tab, 5);

  for(int i = 0; i< 5; ++i) 
    cout << tab[i] << endl;
  endl(cout);
  for(int i = 0; i< 5; ++i) 
    cout << tab2[i] << endl;
  return 0;
}
