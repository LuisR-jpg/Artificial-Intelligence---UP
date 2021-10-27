//Encapsulando clase perro
#include <iostream>
#include <string>
using namespace std;
class Perro{
  private: 
    string nombre, raza;
  public:
    Perro(string, string);
    void mostrarDatos();
    void jugar();
    void setNombre(string);
    string getNombre();
    ~Perro(); //Destructor
};
Perro::Perro(string _nombre, string _raza){
  nombre = _nombre;
  raza = _raza;
}
Perro::~Perro(){}
void Perro::mostrarDatos(){
  cout << "Soy un " << raza << " y me llaman " << nombre << endl;
}
void Perro::jugar(){
  cout << "Toy jugando" << endl;
}
void Perro::setNombre(string _nombre){
  nombre = _nombre;
}
string Perro::getNombre(){
  return nombre;
}
int main(){
  Perro perru("Fido", "Doberman");
  perru.mostrarDatos();
  perru.jugar();
  perru.setNombre("Tobby");
  cout << perru.getNombre() << endl;
  perru.~Perro(); //Destruyendo el objeto
  return 0;
}
