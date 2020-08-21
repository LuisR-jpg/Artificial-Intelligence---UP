#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
void generarArr(int arr[], int n){
  for( int i = 0; i < n; i++ )
    arr[i] = rand() % 10;
}
int main(){
  srand(time(NULL));
  int n, m;
  cin >> n >> m;
  if( n != m ){
    cout << "Dimensiones de las matrices no validas. Deben ser cuadradas.";
    return 0;
  }
  int mau[n][m], mad[n][m];
  for( int i = 0; i < n; i++ ){
    generarArr(mau[i], m);
    generarArr(mad[i], m);
  }
  cout << "El producto punto de " << endl;
  for( int i = 0; i < n; i++ ){
    for( int j = 0; j < m; j++ )
      cout << mau[i][j] << " ";
    cout << endl;
  }
  cout << " y " << endl;
  for( int i = 0; i < n; i++ ){
    for( int j = 0; j < n; j++ )
      cout << mad[i][j] << " ";
    cout << endl;
  }
  cout << " es igual a ";
  long res = 0;
  for( int i = 0; i < n; i++ )
    for( int j = 0; j < m; j++ )
      res += mau[i][j] * mad[i][j];
  cout << res << endl;
  return 0;
}
