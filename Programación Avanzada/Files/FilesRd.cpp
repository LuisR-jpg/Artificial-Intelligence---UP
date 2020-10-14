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
  cout << "Inserta nombre, apellidos y numero telefonico separados por un salto de linea." << endl;
  fflush(stdin);
  string a, b;
  long long c;
  getline(cin, a);
  getline(cin, b);
  cin >> c;
  Contacto d(a, b, c);
  return d;
}
ofstream archivo;
int main(){
  bool n = true;
  while( true ){
    fflush(stdin);
    cout << "\tSeleccione una opcion: " << endl;
    cout << "\t\t1. Crear(nombre, apellido, telefono)" << endl;
    cout << "\t\t2. Agregar mas contactos(nombre, apellido, telefono)" << endl;
    cout << "\t\t3. Visualizar contactos existentes" << endl;
    int op;
    cin >> op;
    if( op < 1 || op > 3 ){
      cout << "Opcion incorrecta." << endl;
      return 0;
    }
    if( op != 3 ){
      if( n ){
	n = false;
	archivo.open("Reto 2.txt", ios::app);
	if( archivo.fail() ){
	  cout<<"No se pudo abrir el archivo";
	  exit(1);
	}
      }
      fflush(stdin);
      auto a = nuevo();
      archivo << a.nombre << "\t" << a.apellido << "\t" << a.telefono << endl; 
    }
    else{
      archivo.close();
      n = true;
      ifstream jaja;
      jaja.open("Reto 2.txt", ios::in);
      if( jaja.fail() ){
	cout << "Fallo al leer archivo";
	return 0;
      }
      string a;
      while( !jaja.eof() ){
	getline(jaja, a);
	cout << a << endl;
      }
      jaja.close();
    }
  }
  archivo.close();
  return 0;
}
