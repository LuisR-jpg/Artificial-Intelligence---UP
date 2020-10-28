#include <iostream>
using namespace std;
int Sumadigitos(int a){
  int suma = 0;
  while( a > 0 ){
    suma += a % 10;
    a /= 10;
  }
  return suma;
}
int main(){
  for( int i = 1; i < 10001; i++ )
    if( !(i % Sumadigitos(i)) )
      cout << i << endl;
  return 0;
}
