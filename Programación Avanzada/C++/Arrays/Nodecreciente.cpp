#include <iostream>
using namespace std;
bool chec(int arr[], int n){
  bool res = true;
  for( int i = 1; i < n; i++ ){
    if( arr[i-1] > arr[i] ){
      if( i - 2 < 0 || i + 1 >= n || arr[i-1] <= arr[i+1] || arr[i-2] <= arr[i] ){
	if( res ) res = false;
	else return false;
      }
      else if( arr[i-2] > arr[i] && arr[i-1] > arr[i+1] )
	return false;
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
