#include <iostream>
using namespace std;
int main(){
  cout << "1/3 Bienvenido a tu banco de confianza!\nPuedes realizar las siguientes operaciones: " << endl;
  cout << "1. Retirar efectivo\n2. Consultar saldo" << endl;
  cout << "Que deseas hacer? ";
  int x, sal = 1000;
  cin >> x;
  switch(x){
    case 1: 
      cout << "Cuanto efectivo quieres retirar? ";
      int a; 
      cin >> a;
      if( a > sal ) cout << "\tSaldo insuficiente" << endl;
      else if( a > 0 ){
	cout << "\tImprimiendo... Listo, puedes tomar el dinero" << endl;
	sal -= a;
      }
      break;
    case 2: 
      cout << "\tTu saldo actual es: " << sal << endl;
  }
  cout << endl;
  cout << "2/3 Puedes realizar las siguintes operaciones: " << endl;
  cout << "1. Retirar efectivo\n2. Consultar saldo" << endl;
  cout << "Que deseas hacer? ";
  cin >> x;
  switch(x){
    case 1: 
      cout << "Cuanto efectivo quieres retirar? ";
      int a; 
      cin >> a;
      if( a > sal ) cout << "\tSaldo insuficiente" << endl;
      else if( a > 0 ){
	cout << "\tImprimiendo... Listo, puedes tomar el dinero" << endl;
	sal -= a;
      }
      break;
    case 2: 
      cout << "\tTu saldo actual es: " << sal << endl;
  }
  cout << endl;
  cout << "3/3 Puedes realizar las siguintes operaciones: " << endl;
  cout << "1. Retirar efectivo\n2. Consultar saldo" << endl;
  cout << "Que deseas hacer? ";
  cin >> x;
  switch(x){
    case 1: 
      cout << "Cuanto efectivo quieres retirar? ";
      int a; 
      cin >> a;
      if( a > sal ) cout << "\tSaldo insuficiente" << endl;
      else if( a > 0 ){
	cout << "\tImprimiendo... Listo, puedes tomar el dinero" << endl;
	sal -= a;
      }
      break;
    case 2: 
      cout << "\tTu saldo actual es: " << sal << endl;
  }
}
