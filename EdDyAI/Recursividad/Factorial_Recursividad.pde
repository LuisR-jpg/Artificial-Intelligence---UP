//Factorial recursividad
void setup(){
  print(funcion( 3 ));
}
int funcion( int n ){
  if( n == 1 ) return 1;
  else return funcion(n-1)*n;
}
