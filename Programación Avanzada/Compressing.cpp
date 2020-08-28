#include <iostream>
#include <cstring>
using namespace std; 
int main(){
  cout << "Introduzca una cadena: ";
  char cad[100];
  cin.getline(cad, 100, '\n');
  int n = strlen(cad), q = 0;
  for( int i = 0, swa; i < n; i++, swa = 1 )
    while( swa-- )
      for( int j = n - 1; j > i; j-- )
	if( cad[j] == cad[i] && cad[j-1] != cad[j] ){
	  swa++;
	  char aux = cad[j-1];
	  cad[j-1] = cad[j];
	  cad[j] = aux;
	}
  for( int i = n-1, c = 1; i >= 0; i-- ){
    if( i > 0 && cad[i] == cad[i-1] ){
      c++;
      cad[i] = char(254);
    }
    else{
      if( c > 1 ){
	cad[i+1] = (c / 10? c / 10: c % 10) + '0';
	if( c > 9 ) cad[i+2] = c % 10 + '0';
      }
      c = 1;
    }
  }
  for( int i = 0; i < n; i++ )
    if( cad[i] != char(254) )
      cad[q++] = cad[i];
  cad[q] = '\0';
  cout << cad << endl;
  return 0;
}
