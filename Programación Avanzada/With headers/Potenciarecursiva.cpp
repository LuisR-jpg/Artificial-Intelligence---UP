#include <iostream>
#include "potenciarecursiva.h"
using namespace std;
int main(){
  int x, y, z;
  cin >> x >> y;
  z = potencia(x, y, x);
  cout << x << "^" << y << " = " << z << endl;
  return 0;
}
int potencia(int a, int b, int c){
  if( b <= 1 ) return (b? c: 1);
  else return potencia(a, --b, c*a);
}

