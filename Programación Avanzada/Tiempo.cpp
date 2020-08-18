#include <iostream>
#include "tiempo.h"
using namespace std;
int main(){
  int ti, horas, minutos, segundos;
  cin >> ti;
  tiempo(ti, horas, minutos, segundos);
  cout << ti << " segundos son:" << "\n\t" << horas << " horas" << endl;
  cout << "\t" << minutos << " minutos" << endl;
  cout << "\t" << segundos << " segundos" << endl;
  return 0;
}
void tiempo(int t, int &h, int &m, int &s){
  s = t % 60; t /= 60;
  m = t % 60;
  h = t /= 60;
}
