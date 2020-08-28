#include <iostream>
using namespace std;
int main(){
  cout << "Ingrese las dimensiones de la matriz nxm, respectivamente: ";
  int n, m, **p;
  cin >> n >> m;
  cout << "Introduzca una matriz de " << n << " renglones y " << m << " columnas:" << endl;
  p = new int*[n];
  for( int i = 0; i < n; i++ )
    *(p+i) = new int[m];
  for( int i = 0; i < n; i++ )
    for( int j = 0, in; j < m; j++ ){
      cin >> in;
      *(*(p + i) + j) = in;
    }
  cout << endl;
  for( int i = 0; i < n; i++ ){
    for( int j = 0; j < m; j++ )
      cout << *(*(p+i)+j) << " ";
    cout << endl;
  }
  return 0;
}
