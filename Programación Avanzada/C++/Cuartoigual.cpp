#include <iostream>
using namespace std;
int main(){
  int a, b, c, d;
  cin >> a >> b >> c >> d;
  if( d == a || d == b || d == c )
    cout << "El cuarto numero es igual a alguno de los anteriores";
  return 0;
}
