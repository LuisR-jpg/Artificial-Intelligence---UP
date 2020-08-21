#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
void generarArr(int arr[], int n){
  for( int i = 0; i < n; i++ )
    arr[i] = rand()%10;
}
int main(){
  srand(time(NULL));
  int n = rand() % 10 + 1;
  int arr[n];
  generarArr(arr, n);
  arr[0] = rand()%7 + 1;
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
