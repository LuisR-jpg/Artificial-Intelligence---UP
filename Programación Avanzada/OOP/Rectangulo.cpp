#include "Rectangulo.h"
Rectangulo::Rectangulo(){}
Rectangulo::Rectangulo(double _largo, double _ancho){
  largo = _largo;
  ancho = _ancho;
}
double Rectangulo::perimetro(){
  return 2*largo + 2*ancho;
}
double Rectangulo::area(){
  return largo*ancho;
}
Rectangulo::~Rectangulo(){}
int main(){
  srand(time(NULL));
  Rectangulo rects[10];
  for( int i = 0; i < 10; i++ ){
    rects[i] = Rectangulo(rand()%100+1, rand()%100+1);
    cout << "El area del rectangulo " << i+1 << " es " << rects[i].area() << " y el perimetro es " << rects[i].perimetro() << endl;
    rects[i].~Rectangulo();
  }
  return 0;
}
