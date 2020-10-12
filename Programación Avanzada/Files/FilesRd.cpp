#include <iostream> 
#include <string.h>
#include <fstream>
#include <vector>
using namespace std;
class Contacto{
  public:
    string nombre, apellido;
    long long telefono;
    Contacto(string _nombre, string _apellido, long long _telefono){
      nombre = _nombre;
      apellido = _apellido;
      telefono = _telefono;
    }
    ~Contacto(){}
};
Contacto nuevo(){
  cout << "Inserta nombre, apellidos y numero telefónico separados por un salto de linea." << endl;
  fflush(stdin);
  string a, b;
  long long c;
  getline(cin, a);
  getline(cin, b);
  cin >> c;
  Contacto d(a, b, c);
  return d;
}
int main(){
  cout << nuevo().nombre << endl;
  cout << nuevo().apellido << endl;
  cout << nuevo().telefono << endl;
  return 0;

  vector<Contacto> vec;
  while( true ){
    cout << "Seleccione una opción: " << endl;
    cout << "\t1. Crear(nombre, apellido, telefono)" << endl;
    cout << "\t2. Agregar mas contactos(nombre, apellido, telefono)" << endl;
    cout << "\t3. Visualizar contactos existentes" << endl;
    int op;
    cin >> op;
    if( op < 1 || op > 3 ){
      cout << "Opción incorrecta." << endl;
      continue;
    }
    if( op != 3 ){
      if( !vec.size() ){} //crear();
//      vec.push_back(nuevo());
//      escribir();
    }
    else{}

  }
  return 0;
}
