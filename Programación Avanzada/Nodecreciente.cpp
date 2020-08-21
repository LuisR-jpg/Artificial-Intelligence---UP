#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
void generarArr(int arr[], int n){
  for( int i = 0; i < n; i++ )
    arr[i] = rand()%100;
}
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
  srand(time(NULL));
  int n = rand()%50 + 1;
  int arr[n];
//  generarArr(arr, n); //Completamente random
  for( int i = 0; i < n; i++ ) arr[i] = i; arr[rand()%n] = 0; //Para comprobar que funciona
  cout << (chec(arr, n)? "Es": "No es") << " posible hacerlo no decreciente." << endl;
  for( int i = 0; i < n; i++ )
    cout << arr[i] << " ";
  return 0;
}
