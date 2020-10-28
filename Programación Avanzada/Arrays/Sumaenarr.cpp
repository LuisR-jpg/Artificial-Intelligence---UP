#include <iostream>
using namespace std;
int main(){
  int numeros[4] = {1, 2, 3, 4}, suma = 0;
  for( int i = 0; i < 4; i++ )
    suma += numeros[i];
  cout << suma << endl;
  return 0;
}
