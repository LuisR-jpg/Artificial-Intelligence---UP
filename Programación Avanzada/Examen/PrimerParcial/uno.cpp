#include <iostream>
using namespace std;
int n, t;
void findTarget(int arr[], int g){
  for( int i = 0; i < n; i++ )
    for( int j = 0; j < n; j++ )
      if( i != j && arr[i] + arr[j] == g ){
	cout << i << " " << j << endl;
	return;
      }
  cout << -1;
}
int main(){
  cout << "Ingrese numero de elementos y target: ";
  cin >> n >> t;
  int arr[n+5];
  for( int i = 0; i < n; i++ )
    cin >> arr[i];
  findTarget(arr, t);
  return 0;
}
