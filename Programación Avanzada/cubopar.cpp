#include <iostream>
using namespace std;
int main(){
  cout << "Bienvenido! Que deseas hacer?" << endl;
  cout << "1. Calcular el cubo de un numero\n2. Checar la paridad de un numero\n3. Salir" << endl;
  cout << "Por favor, escoge una opcion: ";
  int o;
  cin >> o;
  if( o > 0 && o < 3 ){
    cout << "Inserta el numero: ";
    long long x; 
    cin >> x;
    switch(o){
      case 1: 
	cout << x << " elevado al cubo es: " << x*x*x;
	break;
      case 2: 
	cout << "El numero " << x << " es ";
	if( x % 2 ) cout << "impar.";
	else cout << "par.";
    }
  }
  else
    cout << "Bye bye!";
  return 0;
}
