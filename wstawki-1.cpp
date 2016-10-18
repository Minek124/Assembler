#include <iostream>

using namespace std;

int main(){
  const int n = 5;
  int tab[n] = {1, 2, 3, 4, 5};
  int tab2[n] = {6, 7, 8, 9, 10};
  
  
  for(int i = 0; i< n; ++i) 
    cout << tab[i] << endl;
  for(int i = 0; i< n; ++i) 
    cout << tab2[i] << endl;
  endl(cout);


  asm(  "CLD;"  
		".loop:;"
		"movsd;"
		"sub $1, %2;"
		"jnz .loop"
	:
    :  "D"(tab2), // rdi = %0
       "S"(tab), // rsi = %1
       "r"(n)   // %2
  );  
  
  for(int i = 0; i< n; ++i) 
    cout << tab[i] << endl;
  for(int i = 0; i< n; ++i) 
    cout << tab2[i] << endl;
  endl(cout);
  return 0;
}
