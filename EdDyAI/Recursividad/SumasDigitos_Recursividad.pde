//Sumas digitos 
void setup(){
  print( funcion( 91, 0 ) );
}
int funcion( int n, int sum ){
  if( n / 1 == 0 ) return sum;
  else{
    sum += n % 10;
    return funcion( n/10, sum );
  }
}
