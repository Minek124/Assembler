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

using namespace std;
class Faktura{
private:
  int id;
  float obrot;
  float podatekNaliczony;
  float stawkaPodatku; 
  static int nextID; 
public:
  Faktura(double obrot,  double stawkaPodatku = 0.23, double podatekNaliczony = 0.0):
  id(nextID++), obrot(obrot), 
  podatekNaliczony(podatekNaliczony), stawkaPodatku(stawkaPodatku){}
};

int Faktura::nextID = 0;

extern "C" float podatek(Faktura f);
extern "C" void wypisz(const Faktura & f); 

int main(){
  Faktura buraki(1000,  0.23, 100);
  Faktura buraki2(2000,  0.3, 200);
  printf("Podatek : %f\n", podatek( buraki));

  wypisz(buraki);
wypisz(buraki2);
  return 0;
}
