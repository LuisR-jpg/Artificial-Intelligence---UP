#include <time.h>
#include "Alumno.h"
using namespace std;
Alumno::Alumno(){}
Alumno::Alumno(string _nombre, double _p1, double _p2, double _p3){
  nombre = _nombre;
  p1 = _p1;
  p2 = _p2;
  p3 = _p3;
}
double Alumno::calcularFinal(){
  f = (p1+p2+p3)/3;
  return f;
}
void Alumno::informacion(){
  cout << nombre << ".\tCalificacion = " << f << endl;
}
Alumno::~Alumno(){}
int main(){
  srand(time(NULL));
  Alumno alumnos[10];
  for( int i = 0; i < 10; i++ ){
    alumnos[i] = Alumno("Alumno" , (1 + rand()%10), (1 + rand()%10), (1 + rand()%10));
    alumnos[i].calcularFinal();
  }
  for( int i = 0; i < 10; i++ ){
    alumnos[i].informacion();
    alumnos[i].~Alumno();
  }
  return 0;
}
