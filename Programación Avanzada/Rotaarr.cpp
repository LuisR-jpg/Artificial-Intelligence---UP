#include <iostream>
#include <stdlib.h>
#include <time.h>
void generarArr(int arr[], int n){
  for( int i = 0; i < n; i++ )
    arr[i] = rand()%10;
}
using namespace std;
int main(){
  srand(time(NULL));
  int n = rand() % 50 + 1, k = 3; //Tamaño aleatorio del arreglo y se rota 3 veces
  int ori[n], res[n];
  generarArr(ori, n);
  for( int i = 0; i < n; i++ )
    res[(i+k)%n] = ori[i];
  for( int i = 0; i < n+k; i++ ){
    if( i < k ) cout << "  ";
    else cout << ori[i-k] << " ";
  }
  cout << endl;
  for( int i = 0; i < n; i++ )
    cout << res[i] << " ";
  return 0;
}
