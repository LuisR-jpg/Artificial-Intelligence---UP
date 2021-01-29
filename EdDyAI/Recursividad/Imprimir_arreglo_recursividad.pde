//Imprimir arreglo
int x[] = new int[5];
void setup(){
  for( int i = 0; i < x.length; i++ )
    x[i] = (int)random(300);
  funcion( x.length-1 );
}
void funcion( int n ){
  if( n < 0 )
    return;
   else println(x[n]);
   funcion( n-1 );
}
