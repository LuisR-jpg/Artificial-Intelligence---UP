#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
bool chec(int arr[], int n){
  bool res = true;
  for( int i = 1; i < n; i++ ){
    if( arr[i-1] > arr[i] ){
      if( !res ) return false;
      else res = false;
    }
  }
  return true;
}
int main(){
  cout << "Por favor ingresa el numero de elementos: ";
  int n;
  cin >> n;
  int arr[n];
  cout << "Ingresa " << n << " enteros." << endl;
  for( int i = 0; i < n; i++ )
    cin >> arr[i];
  cout << (chec(arr, n)? "Es": "No es") << " posible hacerlo no decreciente." << endl;
  return 0;
}
