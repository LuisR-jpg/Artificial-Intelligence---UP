#include <iostream>
using namespace std;
int suma();
int arr[] = {-2,1,-3,4,-1,2,1,-5,4};
int main(){
  cout << suma();
  return 0;
}
int suma(){
  int suma = arr[0], aux = 0;
  for( int i = 0; i < sizeof(arr)/sizeof(arr[0]); i++ ){
    if( aux + arr[i] < aux ){
      if( aux > suma ){
	suma = aux;
	aux += arr[i];
      }
      else 
	aux = 0;
    }
    else
      aux += arr[i];
  }
  return (aux > suma? aux: suma);
}
