#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
int main(){
  int n;
  cout << "Ingresa el tamano del arreglo: ";
  cin >> n;
  cout << "Por favor ingresa " << n << " enteros. " << endl;
  int arr[n];
  for( int i = 0; i < n; i++ )
    cin >> arr[i];
  for( int i = 0; i < n; i++ )
    cout << arr[i];
  cout << " + 1 = ";
  for( int i = n-1; i >= 0; i-- ){
    arr[i] += 1;
    if( arr[i] == 10 ) arr[i] = 0;
    else break;
  }
  for( int i = 0; i < n; i++ )
    cout << arr[i];
  return 0;
}
