#include <iostream>
using namespace std;
int main(){
  int n;
  cout << "Ingrese un numero: ";
  cin >> n;
  cout << "\t\t";
  for( int i = 0; i < 8*n; i++ )
    cout << "-";
  cout << endl;
  for( int i = 1; i < n+1; i++ ){
    cout << i << "*\t\t";
    for( int j = 1; j < n+1; j++ ){
      cout << i*j << "\t";
    }
    cout << endl;
  }
  return 0;
}
