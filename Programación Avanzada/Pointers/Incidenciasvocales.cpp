#include <iostream>
#include <cstring>
using namespace std;
int main(){
  cout << "Ingrese una cadena de texto: ";
  char *po = new char[100]; 
  int a = 0, e = 0, i = 0, o = 0, u = 0;
  cin.getline(po, 100, '\n');
  do{
    if( *po == 'a' ) a++;
    if( *po == 'e' ) e++;
    if( *po == 'i' ) i++;
    if( *po == 'o' ) o++;
    if( *po == 'u' ) u++;
  }
  while( *(po++) != '\0' );
  cout << a << endl;
  cout << e << endl;
  cout << i << endl;
  cout << o << endl;
  cout << u << endl;
  return 0;
}
