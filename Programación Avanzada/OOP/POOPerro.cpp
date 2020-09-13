//Destructores
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
int main(){
  Perro perru("Fido", "Doberman");
  perru.mostrarDatos();
  perru.jugar();
  perru.~Perro(); //Destruyendo el objeto
  return 0;
}
