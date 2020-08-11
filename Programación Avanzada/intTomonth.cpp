#include <iostream>
using namespace std;
int main(){
  int a;
  cin >> a;
  if( a == 1 ) cout << "Enero";
  else if( a == 2 ) cout << "Febrero";
  else if( a == 3 ) cout << "Marzo";
  else if( a == 4 ) cout << "Abril";
  else if( a == 5 ) cout << "Mayo";
  else if( a == 6 ) cout << "Junio";
  else if( a == 7 ) cout << "Julio";
  else if( a == 8 ) cout << "Agosto";
  else if( a == 9 ) cout << "Septiembre";
  else if( a == 10 ) cout << "Octubre";
  else if( a == 11 ) cout << "Noviembre";
  else if( a == 12 ) cout << "Diciembre";
  else cout << "Numero insertado no valido";
  return 0;
}
