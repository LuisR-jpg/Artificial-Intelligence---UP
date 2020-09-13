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
  int n;
  cin >> n;
  cout << Sumadigitos(n);
  return 0;
}
