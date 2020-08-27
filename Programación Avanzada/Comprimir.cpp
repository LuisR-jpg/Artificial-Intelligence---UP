#include <iostream>
#include <cstring>
using namespace std;
int main(){
  cout << "Ingrese una cadena de texto: ";
  char cad[100];
  cin.getline(cad, 100, '\n');
  int n = strlen(cad), c = 1, p = 1;
  for( int i = 1; i < n; i++ ){
    if( cad[i] == cad[i-1] && i < n-1 ){
      c++;
    }
    else{
      cad[p++] = cad[i];
      if( c > 1 ){
	cad[p] = c;
	if( c > 9 ) p++;
	p++;
	c = 1;
      }
    }
//    if( c > 1 && (cad[i] != cad[i-1] || i+1 == n) ){
//      if( c > 9 ){
//      cad[i+1-c] = c / 10 + 48;
//      cad[i+2-c] = c % 10 + 48;
//  }
//  else cad[i+1-c] = c + 48;
//  	c = 1;
//      cad[p++] = c;
//      c = 1;
//    }
  }
  cout << cad;
  return 0;
}
