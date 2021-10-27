//Fractal recursividad
void setup(){
  size(800, 800);
  background((int)random(255));
  funcion( 400, 400, 450 );
}
void funcion( int n, int x, int y ){
  fill((int)random(255), (int)random(255), (int)random(255));
  ellipse( x, y, n, n );
  if( n <= 1 )
    return;
   else{
     funcion( n/2, x-n/2, y );     
     funcion( n/2, x+n/2, y );   
     //funcion( n/2, x, y+n/2 );
     funcion( n/2, x, y-n/2 );
   }
}
