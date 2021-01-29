//Suma Anteriores Pares
void setup(){
  int x = 9;
  x = x % 2 == 0? x: x+1;
  print(funcion( 10 ));
}
int funcion( int n ){
  if( n <= 2 ) return 2;
  else return n+funcion(n-2);
}
