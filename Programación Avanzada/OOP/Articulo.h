#include <iostream>
#include <string>
using namespace std;
class Articulo{
  private:
    string nombre, descripcion;
    bool nacionalidad;
  public:
    double precio;
    Articulo();
    Articulo(string, double, bool);
    bool isMexicana();
    void setNacionalidad(bool);
    ~Articulo();
}; 
