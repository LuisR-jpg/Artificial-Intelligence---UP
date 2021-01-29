int board = 8, c = 1;
boolean pintar[][] = new boolean[board][board];
int res[][] = new int[100][board];
void setup() {
  size(640, 640);
  backtrack(0);
  frameRate(1);
}
int a = 0;
void draw() {
  if(a >= c-1) while(true);
  background(255);
  imprimir_mat( a++ );
}
void imprimir() {
  for ( int i = 0; i < board; i++ ) {
    for ( int j = 0; j < board; j++ ) {
      char aux = pintar[i][j]? 'o': '*';
      print(aux + " ");
    }
    println();
  }
  println();
}
void imprimir_mat( int pos ) {
  for ( int j = 0; j < board; j++ ) {
    for ( int k = 0; k < board; k++ ) {
      fill( (j+k) % 2 == 0? 255: 0 );
      rect( k*80, j*80, 80, 80 );
      if ( res[pos][k] == j ) {
        fill( 255, 0, 0 );
        circle( k*80+40, j*80+40, 40 );
      }
    }
  }
}
boolean checar(int x, int y) {
  for ( int i = 0; i < x; i++ )
    for ( int j = 0; j < board; j++ )
      if ( (pintar[i][j]) && (abs(x-i) == abs(y-j) || abs(x-i) == 0 || abs(y-j) == 0) ) return false;
  return true;
}
void guardar() {
  for ( int i = 0; i < board; i++ )
    for ( int j = 0; j < board; j++ )
      if ( pintar[j][i] ) res[c-1][i] = j;
}
void backtrack(int col) {
  if ( col >= board ) return;
  for ( int i = 0; i < board; i++ ) {
    if ( checar(col, i) ) pintar[col][i] = true;
    else continue;
    backtrack(col+1);
    if ( col == board-1 && checar(col, i) ) {
      guardar();
      println(c++);
      imprimir();
      //imprimir(pintar);
    }
    pintar[col][i] = false;
  }
  return;
}
