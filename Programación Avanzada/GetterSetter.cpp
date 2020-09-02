#include <iostream>
using namespace std;
class Punto{
  private:
    int x, y;
  public:
    Punto();
    Punto(int, int);
    int getX();
    int getY();
    void setPunto(int, int);
};
Punto::Punto(){}
Punto::Punto(int _x, int _y){
  x = _x;
  y = _y;
}
int Punto::getX(){
  return x;
}
int Punto::getY(){
  return y;
}
void Punto::setPunto(int _x, int _y){
  x = _x;
  y = _y;
}
int main(){
  Punto point(1,2);
  cout << point.getX() << " " << point.getY() << endl;
  point.setPunto(5, 3);
  cout << point.getX() << " " << point.getY() << endl;
  return 0;
}
