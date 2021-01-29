//Fibonacci
void setup(){
  print(funcion( 3 ));
}
int funcion( int n ){
  if( n == 1 ) return 1;
  else if( n == 0 ) return 0;
  else return funcion(n-1)+funcion(n-2);
}
