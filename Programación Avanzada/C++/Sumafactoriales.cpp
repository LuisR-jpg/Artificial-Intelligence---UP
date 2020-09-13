#include <iostream>
using namespace std;
int main(){
  int n, suma = 0, factorial = 1;
  cin >> n;
  for( int i = 1; i <= n; i++ ){
    factorial *= i;
    suma += factorial;
  }
  cout << suma;
  return 0;
}
