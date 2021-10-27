#include <iostream>
#include <string.h> //Funciones para escritura de archivos
#include <fstream>
using namespace std;
void lectura(){
  ifstream archivo;
  string nombre, texto;
  cout << "Escribe nombre: ";
  getline(cin, nombre);
  archivo.open(nombre, ios::in);
  if( archivo.fail() ){
    cout << "El archivo no se pudo abrir" << endl;
    exit(1);
  }
  while( archivo.eof() ){
    getline(archivo, texto);
    cout << texto;
  }
  archivo.close();
}
int main(){
  lectura();
  return 0;
}
