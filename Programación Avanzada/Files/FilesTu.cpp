#include <iostream> 
#include <string.h>
#include <fstream>
#include <vector>
#include <map>
using namespace std;
class Contacto{
  public:
    string nombre, apellido;
    long long telefono;
    Contacto(){}
    Contacto(string _nombre, string _apellido, long long _telefono){
      nombre = _nombre;
      apellido = _apellido;
      telefono = _telefono;
    }
    Contacto(string _nombre, string _apellido){
      nombre = _nombre;
      apellido = _apellido;
      telefono = 0;
    }
    ~Contacto(){}
    void print() const{
      cout << nombre << " " << apellido << " -> " << telefono;
    }
    bool operator < (const Contacto &other) const{
      if(nombre == other.nombre) return apellido < other.apellido;
      return nombre < other.nombre;
    }
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
  map<string, Contacto> phone;
//  map<Contacto, long long> people;
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
      if( op == 1 ){
	archivo.close();
	ofstream f;
      	f.open("Reto 2.txt", ios::out);
      	f << "";
      	f.close();
	n = true;
      }
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
//      people[Contacto(a.nombre, a.apellido)] = a.telefono;
      phone[a.nombre] = a;
    }
    else{
      /*
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
      */
      /*
      for(auto i = people.begin(); i != people.end(); i++){
	i -> first.print();
	cout << ": " << i -> second << endl;
      }
      */
      cout << endl;
      for(auto i = phone.begin(); i != phone.end(); i++){
	cout << endl << i -> first << ": ";
	i -> second.print();
      }
      cout << endl;
    }
  }
  archivo.close();
  return 0;
}
