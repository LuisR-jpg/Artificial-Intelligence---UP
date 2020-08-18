//Regresa la parte fraccionaria de un numero. Ej: 239.876 -> 0.876
#include <iostream>
using namespace std;
void pedirDatos();
float devFraccionaria(float);
float numero;
int main(){
  pedirDatos();
  cout << devFraccionaria(numero);
  return 0;
}
void pedirDatos(){
  cout << "Digite su numero: ";
  cin >> numero;
}
float devFraccionaria(float n){
  int entero = n;
  return n - entero;
}
