#include <iostream>
#include <string.h>
using namespace std;
int main(){
  char arr[50];
  cin.getline(arr, 50, '\n'); //Apoyo para lectura de caracteres, donde se guarda, limite maximo, caracter que indica fin de lectura
  if(strlen(arr) > 10) cout << arr;
  else cout << "La cadena no supera 10 caracteres";
  return 0;
}
