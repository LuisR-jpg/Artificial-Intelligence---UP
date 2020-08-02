void swap( int[] arr, int a, int b ) {
  int aux = arr[a];
  arr[a] = arr[b];
  arr[b] = aux;
}
void printa( int arr[] ) {
  for ( int i = 0; i < n; i++ )
    print((i == 0? "[": "") + arr[i] + (i == n-1? "]\n": ", "));
}
void printa( int arr[], boolean debug ) {
  print(debug? "\t": "");
  printa(arr);
}
void printa( int arr[], int ini, int fin ) {
  print("\t");
  for ( int i = ini; i <= fin; i++ )
    print((i == ini? "[": "") + arr[i] + (i == fin? "]\n": ", "));
}
boolean checar( int arr[] ){
  for( int i = 2; i < arr.length; i++ )
    if( arr[i] < arr[i-1] ) return false;
  return true;
}
