//Decimal a binario
void setup(){
  funcion( 10 );
}
void funcion( int n ){
  if( n == 0 ) return;
  else{
    funcion( n/2 ); 
    print(n%2);
  }
}
