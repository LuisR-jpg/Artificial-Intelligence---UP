//En realidad no es producto punto
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
  int nu, nd, mu, md;
  cout << "Ingresa los valores correspondientes para n1, n2, m1 y m2: ";
  cin >> nu >> nd >> mu >> md;
  if( nu != nd || nd != mu || mu != md ){
    cout << "Dimensiones de las matrices no validas. Deben ser cuadradas.";
    return 0;
  }
  int mau[nu][nd], mad[mu][md];
  for( int i = 0; i < nu; i++ ){
    generarArr(mau[i], nd);
    generarArr(mad[i], md);
  }
  cout << "El producto de " << endl;
  for( int i = 0; i < nu; i++ ){
    for( int j = 0; j < nd; j++ )
      cout << mau[i][j] << " ";
    cout << endl;
  }
  cout << " y " << endl;
  for( int i = 0; i < mu; i++ ){
    for( int j = 0; j < md; j++ )
      cout << mad[i][j] << " ";
    cout << endl;
  }
  cout << "es igual a " << endl;
  int res[nu][md];
  for( int i = 0; i < nu; i++ ){
    for( int j = 0; j < md; j++ ){
      int sum = 0;
      for( int k = 0; k < nu; k ++ ){
	sum += mau[i][k] * mad[k][j];
      }
      res[i][j] = sum;
      cout << res[i][j] << " ";
    }
    cout << endl;
  }
  return 0;
}
