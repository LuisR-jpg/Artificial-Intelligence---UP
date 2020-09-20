//Para cada new, necesitamos un delete
#include <iostream>
#include <string>
using namespace std;
class Alumno{
  public: 
    string nombre;
    float calificacion;
    void imprimir(){
      cout << nombre << " " << calificacion << endl;
    }
    Alumno(){
      cout << "Alumno()" << endl;
    }
    ~Alumno(){
      cout << "~Alumno()" << endl;
    }
};
void funcion(){
  Alumno a;
  a.imprimir();
  //Se destruye cuando termina la funcion
}
int main(){
 // int a = 10;
 // int *b = new int;
 // (*b) = 20;
 // cout << "a: " << a << endl;
 // cout << "b: " << b << endl;
 // delete b;

 // Alumno a;
 // a.nombre = "A";
 // a.calificacion = 10.0;
 // a.imprimir();
 // Alumno *b = new Alumno();
 // b -> nombre = "B";
 // b -> calificacion = 9.2;
 // b -> imprimir();
 // delete b;

  funcion();
  return 0;
}
