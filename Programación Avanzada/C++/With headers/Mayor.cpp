#include <iostream>
#include "mayor.h"
using namespace std;
int main(){
  int fu, fd, ft, fau, fad, fat;
  cout << "Inserte fecha 1 (dd/mm/aaaa): ";
  cin >> fu >> fd >> ft;
  cout << "Inserte fecha 2 (dd/mm/aaaa): ";
  cin >> fau >> fad >> fat;
  if( validar(fu, fd, ft) && validar(fau, fad, fat) ){
    mayor(fu, fd, ft, fau, fad, fat);
    cout << "La fecha mas reciente es " << fu << "/" << fd << "/" << ft << endl;
  }
  else cout << "Hay al menos una fecha introducida no valida." << endl;
  return 0;
}
void mayor(int &u, int &d, int &t, int c, int f, int s){
  if( s > t || (s == t && f > d) || (s == t && f == d && c > u) ){
    u = c;
    d = f;
    t = s;
  }
}
bool validar(int d, int m, int a){
  return (d > 0 && d < 31 && m > 0 && m < 13 && a > 0? true: false);
}
