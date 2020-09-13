#include <iostream>
#include <string.h>
using namespace std;
class Persona{
  private:
    string nombre;
    int edad;
  public:
    Persona(string, int);
    void comer();
    void leer();
};
//Constructor
Persona::Persona(string _nombre, int _edad){
  nombre = _nombre;
  edad = _edad;
} 
void Persona::comer(){
  cout << "Soy " << nombre << " y estoy comiendo. Tengo " << edad << endl;
}
void Persona::leer(){
  cout << "Soy " << nombre << " y estoy leyendo. Tengo " << edad << endl;
}
int main(){
  Persona p = Persona("Lalito", 15);
  Persona s = Persona("Sara", 100);
  s.comer();
  p.leer();
  return 0;
}
