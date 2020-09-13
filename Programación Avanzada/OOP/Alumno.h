#include <iostream>
#include <string>
using namespace std;
class Alumno{
  private:
    double p1, p2, p3, f;
    string nombre;
  public:
    Alumno();
    Alumno(string, double, double, double);
    double calcularFinal();
    void informacion();
    ~Alumno();
};
    
