//Descendentes pares 
int x = 11;
void setup(){
  x = x % 2 == 0? x: x-1;
  funcion( x );
}
void funcion( int n ){
  if( n <= 0 )
    return;
   else println(n);
   funcion( n-2 );
}
