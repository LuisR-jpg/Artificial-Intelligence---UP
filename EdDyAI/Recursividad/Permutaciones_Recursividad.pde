//Permutaciones recursividad
String hola = "mano";
char[] arr = new char[10];
void setup(){
  for( int i = 0; i < hola.length(); i++ )
    arr[i] = hola.charAt(i);
  println();
  permutations( hola, "" );
  //funcion(arr, hola.length(), 0);
}

void funcion(char arr[], int n, int i ){
  if( i == n ){
    for( int m = 0; m < hola.length(); m++ )
      print(arr[m]);
    println();
  }
  for( int j = i; j < n; j++ ){
    char aux = arr[j];
    arr[j] = arr[i];
    arr[i] = aux;    
    funcion(arr, n, i+1);
    aux = arr[j];
    arr[j] = arr[i];
    arr[i] = aux;
  }
}
void permutations( String s, String imp ){
  if( s.length() == 0 ) println(imp);
  for( int i = 0; i < s.length(); i++ ){
    permutations( s.substring(0, i) + s.substring( i+1, s.length() ), imp + s.charAt(i) );
  }
}
