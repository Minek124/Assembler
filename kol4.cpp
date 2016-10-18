#include <iostream>
using namespace std;
// wynik[i] = (x-a[i])*(x+1)
extern "C" void oblicz(float *wynik, int n, float x, float * a);

int main(){
 const int rozmiar = 16;
 float a[rozmiar] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
 float wynik[rozmiar];
 oblicz(wynik, rozmiar, 4.0, a);
 
 for(int i =0; i< rozmiar; i++){
 cout << wynik[i] << " ";
 }
 cout << endl;
 return 0;
}
/* Spodziewane wyjście
 * 15 10 5 0 -5 -10 -15 -20 -25 -30 -35 -40 -45 -50 -55 -60 
 */
