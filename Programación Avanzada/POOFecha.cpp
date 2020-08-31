//Sobrecarga de constructores
#include <iostream>
#include <string>
using namespace std;
class Fecha{
  private: 
    int dia, mes, anio;
  public:
    Fecha(int, int, int);
    Fecha(long);
    void mostrarFecha();
};
Fecha::Fecha(int _dia, int _mes, int _anio){
  dia = _dia;
  mes = _mes;
  anio = _anio;
}
//Fecha 20200830
Fecha::Fecha(long _fecha){
  anio = int(_fecha/10000);
  mes = int(_fecha%10000/100);
  dia = int(_fecha%10000%100);
}
int main(){
  Fecha hoy(30, 8, 2020);
  Fecha manana(20200831);
  return 0;
}
