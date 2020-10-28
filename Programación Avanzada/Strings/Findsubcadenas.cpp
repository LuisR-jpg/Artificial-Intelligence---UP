#include <iostream>
#include <string.h>
using namespace std;
int main(){
  cout << "Ingresa el numero de palabras: ";
  int n; 
  cin >> n; 
  cout << "Escribe " << n << " palabras separadas por un salto de linea. " << endl;
  char w[n][100];
  char aux[10];
  cin.getline(aux, 10, '\n');
  for( int i = 0; i < n; i++ )
    cin.getline(w[i], 100, '\n');
  for( int i = 0; i < n; i++ ){
    for( int j = 0; j < n; j++ ){
      if( i != j ){
	char *cad = strstr(w[i], w[j]);
	if( cad != NULL )
	  cout << w[j] << endl;
      }
    }
  }
  return 0;
}
