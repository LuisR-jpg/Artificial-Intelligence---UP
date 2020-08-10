//Division Entera Recursividad
void setup(){
  print(funcion( 15, 2, 0 ));
}
int funcion( int n, int d, int m ){
  if( n - d < 0 ) return m;
  else return funcion( n-d, d, m+1 );
}
