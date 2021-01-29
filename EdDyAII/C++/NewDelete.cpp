#include <iostream>
#include <string>
using namespace std;
struct hamburguesa{
  string marca;
  int jitomates;
  double precio;
};
int main(){
  hamburguesa *h = new hamburguesa;
  h -> marca = "Burguer King";
  h -> jitomates = 3;
  h -> precio = 50;
  cout << h -> marca << " " << h -> jitomates << h -> precio << endl;
  delete h;
  return 0;
}
