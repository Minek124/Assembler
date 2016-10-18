// kompilacja 
//   g++ -fno-devirtualize -c main.cpp -o main.o
//   nasm -felf64 zmien.asm -o zmien.o
//   g++ -fno-devirtualize main.o zmien.o -o main

#include <iostream>
using namespace std;

class A{
  public:
  virtual int oblicz(int n){
    return n*n;
  }
};

extern "C" void zmien(A & a);


int main(){
  A a, b; 
  A *pa = &a, *pb = &b; 
  cout << pa->oblicz(1)<< " "<< pb->oblicz(2) << endl;
  zmien(a);
  cout << pa->oblicz(1)<< " "<< pb->oblicz(2) << endl;
   
  return 0;
}
// Spodziewane wyjście:
// 1 4
// 0 4
