#include <iostream>
using namespace std;
int main(){
  int arr[] = {1, 2, 4, 5, 6, 10};
  int tam = sizeof(arr)/sizeof(arr[0]);
  for( int i = tam-1; i >= 0; i-- )
    cout << arr[i] << " ";
  return 0;
}
