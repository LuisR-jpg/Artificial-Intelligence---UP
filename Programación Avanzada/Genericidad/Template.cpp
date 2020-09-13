#include <iostream>
using namespace std;
template<class TIPOD>
void despliegue(TIPOD dato);
template<class TIPOD>
void despliegue(TIPOD dato){
  cout << "El dato es: " << dato << endl;
}
int main(){
  int dato1 = 1;
  float dato2 = 2.3;
  double dato3 = 3.54;
  char dato4 = 'a';
  despliegue(dato1);
  despliegue(dato2);
  despliegue(dato3);
  despliegue(dato4);
  return 0;
}
