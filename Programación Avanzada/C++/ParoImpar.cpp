#include <iostream>
using namespace std;
int main(){
  int numero;
  cout << "Digita el numero: ";
  cin >> numero;
  if( numero == 0 )
    cout << "\nEl numero es cero";
  else if( numero % 2 == 0 ) 
    cout << "\nEl numero es par";
  else 
    cout << "\nEl numero es impar";
  return 0;
}
