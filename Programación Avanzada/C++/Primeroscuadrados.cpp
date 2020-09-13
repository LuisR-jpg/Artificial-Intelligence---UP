#include <iostream>
using namespace std;
int suma;
int main(){
  for( int i = 1; i < 11; i++ )
    suma += i*i;
  cout << suma;
  return 0;
}
