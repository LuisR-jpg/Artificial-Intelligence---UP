//Ascendentes Recursividad
int x = 6;
void setup(){
  funcion( 1 );
}
void funcion( int n ){
  if( n > x ) return;
  else{ print(n); print(" "); funcion(n+1); }
}
