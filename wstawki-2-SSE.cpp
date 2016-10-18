#include <iostream>

using namespace std;

char * dodaj(char * tab1, char * tab2, int n){
	char * tab3 = new char[n];
	for(int i = 0; i < 8; i += 16){
		asm("movdqu (%0), %%xmm0;"  
			"movdqu (%1), %%xmm1;"
			"paddsb %%xmm1, %%xmm0;"
			"movdqu %%xmm0, (%2)"
		:
    	:	"r"(tab1 + i), // %0
			"r"(tab2 + i), // %1
			"r"(tab3 + i) // %2
		);
	}
	return tab3;
}

int main(){
  const int n = 16;
  char tab1[n];
  char tab2[n];
  for(int i = 0; i < n; ++i){
    tab1[i] = 44;
    tab2[i] = 99;
  }
    
  char * tab3 = dodaj(tab1, tab2, n);
  
  for(int i = 0; i< n; ++i) 
    cout << (int)tab1[i] << " " << (int)tab2[i] << " " << (int)tab3[i] << endl;
  endl(cout);
  return 0;
}
