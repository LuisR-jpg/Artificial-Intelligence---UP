#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
int main(){
  srand(time(NULL));
  int x, y;
  cin >> x >> y;
  int mat[x][y], ma[x][y];
  for( int i = 0; i < x; i++ )
    for( int j = 0; j < y; j++ )
      mat[i][j] = (1 + rand()%100); //Numeros del uno al cien
  for( int i = 0; i < x; i++ )
    for( int j = 0; j < y; j++ )
      ma[i][j] = mat[i][j];
  for( int i = 0; i < x; i++ ){
    for( int j = 0; j < y; j++ )
      cout << ma[i][j] << '\t';
    cout << endl;
  }
  return 0;
}
  
