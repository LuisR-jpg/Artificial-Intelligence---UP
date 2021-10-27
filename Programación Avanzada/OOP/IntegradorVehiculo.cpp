//Clase vehículo, padre de carro y camión
//Encapsulando placa
#include <iostream>
#include <string>
using namespace std;

class Vehiculo{
  private:
    string placas;
  public:
    Vehiculo();
    Vehiculo(string);
    void moverse();
    string getPlaca();
    void setPlaca(string);
    ~Vehiculo();
};

//Vehiculo
Vehiculo::Vehiculo(){}
Vehiculo::Vehiculo(string _placas){
  placas = _placas;
}
void Vehiculo::moverse(){
  cout << "Soy un vehiculo y me estoy moviendo" << endl; //Cambiar virtual
}
string Vehiculo::getPlaca(){
  return placas;
}
void Vehiculo::setPlaca(string _placas){
  placas = _placas;
}
Vehiculo::~Vehiculo(){}

class Carro: Vehiculo{
  private:
    int nodemotor;
  public:
    Carro();
    Carro(int);
    void moverse();
};
//Carro
Carro::Carro(){}
Carro::Carro(int _nodemotor){
  nodemotor = _nodemotor;
}
void Carro::moverse(){
  cout << "Soy un carro y me estoy moviendo" << endl;
}
int main(){
  Vehiculo mio = Vehiculo("hola");
  mio.moverse();
  Carro coche = Carro();
  coche.moverse();
  return 0;
}
