#include <iostream>
#include <algorithm>
#include <time.h>
using namespace std;
void bubble(int arr[], int n){
  int sw = 1, i;
  for( int j = n-1; j > 0 && sw > 0; j-- )
    for ( i = 0, sw = 0; i < j; i++ ){
      sw += arr[i] > arr[i+1]? 1: 0;
      if (arr[i] > arr[i+1]) swap(arr[i], arr[i+1]);
    }
}
void print(int arr[], int n){
  for( int i = 0; i < n; i++ )
    cout << arr[i] << " ";
  cout << endl;
}
int main(){
  srand(time(NULL));
  int n = 10;
  int arr[n] = {0};
  for( int i = 0; i < n; i++ )
    arr[i] = rand() % 100;
  print(arr, n);
  bubble(arr, n);
  print(arr, n);
  return 0;
}
