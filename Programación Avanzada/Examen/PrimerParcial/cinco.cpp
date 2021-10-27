#include <iostream>
using namespace std;
int n;
bool isMonotonic(int arr[]){
  bool uno = true, dos = true;
  for( int i = 1; i < n; i++ )
    if( arr[i] - arr[i-1] < 0 ){
      uno = false;
      break;
    }
  for( int i = 1; i < n; i++ )
    if( arr[i] - arr[i-1] > 0 ){
      dos = false;
      break;
    }
  return (uno || dos);
}
int main(){
  cin >> n;
  int arr[n+10];
  for( int i = 0; i < n; i++ )
    cin >> arr[i];
  cout << (isMonotonic(arr)? "true": "false");
  return 0;
}
