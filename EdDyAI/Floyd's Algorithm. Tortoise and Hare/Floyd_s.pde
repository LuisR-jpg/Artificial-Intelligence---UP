PImage tort, hare, trot, ciclo[] = new PImage[12];
int n = 10;
int est = -1, c = 0, con = 0, le = 0, ra = 0, pt2 = 0, pos[][] = new int[2][2*n];
boolean ya = false, ok = false;
int arr[] = generarArr(n, !ok);
void setup(){
  fullScreen();
  //size(displayWidth, 400);
  background(0);
  printa(arr);
  for( int i = 0; i < 12 && ok; i++ ){
    ciclo[i] = loadImage("Ciclo"+(i+1)+".png");
    ciclo[i].resize(0, 425);
  }
  tort = loadImage("Tortoise.png");
  tort.resize(acomoda(0), 0);
  hare = loadImage("Hase.png");
  hare.resize(acomoda(0), 0);
  trot = loadImage("Trot.png");
  trot.resize(acomoda(0), 0);
  do{
    pos[0][c] = acomoda(le);
    pos[1][c++] = acomoda(ra);
    le = arr[le];
    ra = arr[arr[ra]];
  } while( le != ra );
  pos[0][c] = acomoda(le);
  pos[1][c++] = acomoda(ra);
  con = c;
  println();
  int pt1 = le;
  while ( pt1 != pt2 ) {
    pos[0][c] = acomoda(pt1);
    pos[1][c++] = acomoda(pt2);
    pt1 = arr[pt1];
    pt2 = arr[pt2];
  }
  pos[0][c] = acomoda(pt1);
  pos[1][c++] = acomoda(pt2);
  drawArr(arr);
  println(pt1 + " " + c);
}
void draw() {}
void keyPressed(){
  est += keyCode == RIGHT && est < c-1? 1: 0;
  est -= keyCode == LEFT && est > 0? 1: 0;
  if( keyCode == RIGHT || keyCode == LEFT ){
    move( tort, pos[0][est] );
    move( est >= con? trot: hare, pos[1][est] );
    if( ok ) image(ciclo[est], 419, 343);
  }
}
void move( PImage ani, int x ) {
  if ( ani == tort ){
    background(0);
    drawArr(arr);
  }
  image(ani, x, (ok? -50: 0)+(acomoda(0)+((ani == hare || ani == trot)? 190: 120)));
}
int acomoda(int a){ return (width/(2+arr.length) + (width/(2+arr.length)*a)); }
int[] generarArr(int k, boolean j) {
  if( k == 0 ) return new int[] {1, 4, 3, 5, 6, 1, 2}; 
  ok = j;
  if( j ) return new int[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 4};
  int arreglo[] = new int[k], re;
  boolean[] aux = new boolean[k];
  for ( int i = 1; i < k; i++ ) {
    do re = (int)random(k);
    while ( aux[re] );
    arreglo[re] = i;
    aux[re] = true;
  }
  int l = 0;
  while ( aux[l++] );
  arreglo[--l] = (int)random(1, k);
  return arreglo;
}
void printa( int arr[] ) {
  for ( int i = 0; i < arr.length; i++ )
    print((i == 0? "[": "") + arr[i] + (i == arr.length-1? "]\n": ", "));
}
void drawArr(int[] arr) {
  textAlign(CENTER, CENTER);
  noStroke();
  for ( int i = 0; i < arr.length; i++ ) {
    fill(255-arr[i]*20);//255-arr[i]*20
    square( acomoda(i), acomoda(0)+(ok? -50: 0), acomoda(0) );
    fill(0);
    textSize(50);
    text(arr[i] + "", acomoda(i), acomoda(0)+(ok? -50: 0), acomoda(0), acomoda(0));
    fill(255);
    text(est == con-1? "Se encontraron.": "", 200, height == displayHeight? 400: 20);
    text(est == c-1? "El # repetido es: " + (height == displayHeight? "\n\t": "") + pt2: "", 250, height == displayHeight? 400: 20);
    textSize(15);
    text(i + "", acomoda(i), acomoda(0)+(ok? -125: -75), acomoda(0), acomoda(0));
  }
}
