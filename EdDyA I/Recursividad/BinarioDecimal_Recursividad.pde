//Binario a decimal
void setup(){
  print(funcion( 1010, 0, 0 ));
}
int funcion( int n, int m, int c ){
  if( n == 0 ) return m;
  else return funcion( n/10, (int)pow(2,c)*n%10+m, c+1 );  
}
