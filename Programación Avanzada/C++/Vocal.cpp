#include <iostream>
using namespace std;
int main(){
  char l;
  cout << "Inserta un caracter: ";
  cin >> l;
  switch(l){
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
      cout << "Es vocal minuscula";
      break;
    case 'A':
    case 'E':
    case 'I':
    case 'O':
    case 'U':
      cout << "Es vocal mayuscula";
      break;
    default:
      cout << "No es vocal";
      break;
  }
  return 0;
}
