#include <iostream>
#include "myLib.h" //Comillas porque es header customizado
using namespace std;
int cube(int x){
  return x * square(x);
}
int square(int x){
  return x*x;
}
int main(){
  int a = 0;
  cout << "Digite el numero: ";
  cin >> a;
  cout << cube(a) << " " << square(a) << endl;
  return 0;
}
