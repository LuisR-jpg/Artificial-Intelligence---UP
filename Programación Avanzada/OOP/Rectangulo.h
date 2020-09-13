#include <iostream>
#include <time.h>
#include <string.h>
using namespace std;
class Rectangulo{
  private:
    double largo, ancho;
  public:
    Rectangulo();
    Rectangulo(double, double);
    double perimetro();
    double area();
    ~Rectangulo();
};
