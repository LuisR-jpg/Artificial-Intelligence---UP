//Invertir numero
void setup(){
  funcion( Integer.toString(125), 0 );
}
void funcion( String m, int n ){
  if( n >= m.length() ) return;
  else{
    print(m.charAt(m.length()-n-1));
    funcion(m, n+1);
  }
}
