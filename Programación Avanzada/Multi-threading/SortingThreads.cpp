#include <iostream>
#include <thread>
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
void bubble(int arr[], int n){
  int sw = 1, i;
  for( int j = n-1; j > 0 && sw > 0; j-- )
    for ( i = 0, sw = 0; i < j; i++ ){
      sw += arr[i] > arr[i+1]? 1: 0;
      if (arr[i] > arr[i+1]) swap(arr[i], arr[i+1]);
    }
}
int main(){
  srand(time(NULL));
  int n = 10;
  int arr[n], narr[n];
  for( int i = 0, aux = rand() % 100; i < n; i++ )
    narr[i] = arr[i] = rand() % 100;
  print(arr, n);
  thread m(merge, arr, n);
  thread b(bubble, narr, n);
  print(arr, n);
  print(narr, n);
  return 0;
}
