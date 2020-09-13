#include "Articulo.h"
#include <time.h>
Articulo::Articulo(){}
Articulo::Articulo(string _nombre, double _precio, bool _nacionalidad){
  nombre = _nombre;
  precio = _precio;
  nacionalidad = _nacionalidad;
}
bool Articulo::isMexicana(){
  return nacionalidad;
}
void Articulo::setNacionalidad(bool isMexa){
  nacionalidad = isMexa;
}
Articulo::~Articulo(){}
int main(){
  srand(time(NULL));
  Articulo articulos[30];
  double suma = 0;
  for( int i = 0; i < 30; i++ ){
    articulos[i] = Articulo("Articulo", (1+rand()%100), i % 2);
    suma += articulos[i].precio * (articulos[i].isMexicana()? 1.16: 1);
    articulos[i].~Articulo();
  }
  cout << "El valor total es: " << suma << endl;
  return 0;
}
