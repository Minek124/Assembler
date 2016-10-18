#include <iostream>
using namespace std;
extern "C" float sumuj(int n, float x, float * a);
int main(){

 float tab[] = {1, 2, 3, 4, 1, 2, 3, 4, 10, 2, 3, 4, 5};
 int rozmiar = sizeof(tab)/sizeof(float);
 for(int i =4; i<= rozmiar; i+=4){
   cout << i << " => " << sumuj(i, tab[rozmiar-i/4], tab) << endl; 
 }
 cout << "dd" << " => " << sumuj(13, 2.0, tab) << endl; 
 return 0;
}
/* Spodziewane wyjście
4 => 150
8 => 400
12 => 873
*/
