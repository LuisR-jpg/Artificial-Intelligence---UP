//Suma anteriores recursividad
void setup(){
  print(funcion( 5 ));
}
int funcion( int n ){
  if( n <= 1 ) return 1;
  else return n+funcion(n-1);
}
