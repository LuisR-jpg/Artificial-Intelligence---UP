void sorte( Estudiante[] e ){
  for( int i = 1; i < e.length-1; i++ )
    for( int j = i + 1; j > 0 && e[j-1].ID > e[j].ID; j-- )
      swap( e, j, j-1 );
}
void swap( Estudiante[] e, int a, int b ){
  Estudiante aux = e[a];
  e[a] = e[b];
  e[b] = aux;
}
void printe(Estudiante[] e){
  for( int i = 0; i < e.length; i++ )
    println(e[i]);
}
