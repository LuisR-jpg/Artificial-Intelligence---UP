#include <iostream>
using namespace std;
int main(){
  cout << "Ingrese las dimensiones de la matriz nxm, respectivamente: ";
  int n, m, **p, **q;
  cin >> n >> m;
  cout << "Introduzca una matriz de " << n << " renglones de " << m << " columnas:" << endl;
  p = new int*[n];
  for( int i = 0; i < n; i++ )
    *(p+i) = new int[m];
  q = new int*[m];
  for( int i = 0; i < m; i++ )
    *(q+i) = new int[n];
  for( int i = 0; i < n; i++ )
    for( int j = 0, in; j < m; j++ ){
      cin >> in;
      *(*(p + i) + j) = in;
    }
  cout << endl;
  for( int i = 0; i < n; i++ )
    for( int j = 0; j < m; j++ )
      *(*(q+j)+i) = *(*(p+i)+j);
  for( int i = 0; i < m; i++ ){
    for( int j = 0; j < n; j++ )
      cout << *(*(q+i)+j) << " ";
    cout << endl;
  }
  return 0;
}
