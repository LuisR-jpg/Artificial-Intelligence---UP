#include <iostream>
#include <string>
using namespace std;
class Persona{
  private:
    string nombre;
    int edad;
  public:
    Persona();
    Persona(string, int);
    void mostrarPersona();
};
class Alumno: public Persona{
  private:
    string id;
    double notaFinal;
  public:
    Alumno();
    Alumno(string, int, string, double);
    void mostrarAlumno();
};
class AlumnoUP: public Alumno{
  private: 
    string carrera;
  public:
    AlumnoUP();
    AlumnoUP(string, string, int, string, double);
    void mostrarAlumnoUP();
};
Persona::Persona(){}
Alumno::Alumno(){}
AlumnoUP::AlumnoUP(){}
Persona::Persona(string _nombre, int _edad){
  nombre = _nombre;
  edad = _edad;
}
Alumno::Alumno(string _nombre, int _edad, string _id, double _notaFinal): Persona(_nombre, _edad){
  id = _id;
  notaFinal = _notaFinal;
}
AlumnoUP::AlumnoUP(string _carrera, string _nombre, int _edad, string _id, double _notaFinal): Alumno(_nombre, _edad, _id, _notaFinal){
  carrera = _carrera;
}
void Persona::mostrarPersona(){
  cout << "Nombre: " << nombre << "\tEdad: " << edad << endl;
}
void Alumno::mostrarAlumno(){
  mostrarPersona();
  cout << "ID: " << id << "\tNota Final: " << notaFinal << endl;
}
void AlumnoUP::mostrarAlumnoUP(){
  mostrarAlumno();
  cout << "Carrera: " << carrera << endl;
}
int main(){
  AlumnoUP a("IIA", "Carlos", 19, "0224969", 10);
  a.mostrarAlumnoUP();
  Alumno al[10];
  return 0;
}
