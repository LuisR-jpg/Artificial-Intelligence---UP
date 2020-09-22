#include <iostream>
#include <algorithm>
#include <time.h>
using namespace std;
void print(int arr[], int n){
  for( int i = 0; i < n; i++ )
    cout << arr[i] << " ";
  cout << endl;
}
void merrge(int arr[], int ini, int fin){
  if( ini >= fin ) return;
  int m = (ini+fin)/2;
  merrge(arr, ini, m);
  merrge(arr, m+1, fin);
  int i = ini, j = m+1, k = 0, aux[fin-ini+1];
  while( i <= m || j <= fin ) 
    aux[k++] = ((i <= m && j <= fin && arr[i] <= arr[j]) || j > fin? arr[i++]: arr[j++]);
  for( int o = ini; o <= fin; o++ )
    arr[o] = aux[o - ini];
}
void merge(int arr[], int fin){
  merrge(arr, 0, fin-1);
}
int main(){
  srand(time(NULL));
  int n = 10;
  int arr[n] = {0};
  for( int i = 0; i < n; i++ )
    arr[i] = rand() % 100;
  print(arr, n);
  merge(arr, n);
  print(arr, n);
  return 0;
}
