//Descendentes recursividad
int x = 5;
void setup(){
  funcion( x );
}
void funcion( int n ){
  if( n == 0 )
    return;
   else{ print(n); print(" "); }
   funcion( n-1 );
}
