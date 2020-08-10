int nobjetos = 4, capacidad = 4;
int[] ganancia = {1, 4, 2, 5};
int[] peso = {4, 3, 2, 1};
int[] mochila = new int[nobjetos];
int[] mochila_optima = new int[nobjetos];
void setup(){
  for( int i = 0; i < nobjetos; i++ )
    mochila[i] = -1;
  backtracking(0); 
  print_mochila(mochila_optima);
}
int ganancia(int[] mochila){
  int g = 0; 
  for( int i = 0; i < nobjetos; i++ ){
    if( mochila[i] == 1 ){
      g += ganancia[i];
    }
  }
  return g;
}
int peso(int[] mochila){
  int p = 0; 
  for( int i = 0; i < nobjetos; i++ ){
    if( mochila[i] == 1 ){
      p += peso[i];
    }
  }
  return p;
}
void backtracking(int v){
  if( peso(mochila) > capacidad ) return;
  if( v >= mochila.length ){
    print_mochila(mochila);
    if( ganancia(mochila) > ganancia(mochila_optima)){
      for( int i = 0; i < nobjetos; i++ )
        mochila_optima[i] = mochila[i];
    }
    return;
  }
  for( int i = 0; i < nobjetos; i++ ){
    mochila[v] = i;
    backtracking(v+1);
  }
  mochila[v] = -1;
}
void print_mochila(int[] mochila){
  print("[");
  for( int i = 0; i < mochila.length; i++ ){
    print(mochila[i]);
  }
  print("] ");
  print("\tPeso: " + peso(mochila) + "\tGanancia: " + ganancia(mochila) + "\n" ); 
}
