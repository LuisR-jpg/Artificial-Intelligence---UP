#include <iostream>
using namespace std;
int main(){
  cout << "Ingrese el numero de unidades para calcular: ";
  int x;
  double res;
  cin >> x;
  if( x > 0 && x <= 50 ) res = 0.5 * x;
  else if( x <= 150 ) res = 0.75 * x;
  else if( x <= 250 ) res = 1.2 * x;
  else res = 1.5 * x;
  cout << "Monto a pagar: " << 1.2 * res;
  return 0;
}
