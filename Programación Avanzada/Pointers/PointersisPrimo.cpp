#include <iostream>
using namespace std;
int main(){
  int numero, *dirnum, cont = 0;
  cout << "Digite un numero: ";
  cin >> numero;
  dirnum = &numero;
  for( int i = 2; i < *dirnum; i++ ) //Se puede cambiar *dirnum por <= floor(sqrt(*dirnum))
    if( *dirnum % i == 0 ) 
      cont++;
  if( cont ) cout << *dirnum << " no es primo." << endl;
  else cout << *dirnum << " es primo" << endl;
  cout << "Esta en la direccion: " << dirnum;
  return 0;
}
