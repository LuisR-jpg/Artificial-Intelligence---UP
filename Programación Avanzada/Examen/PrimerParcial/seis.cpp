#include <iostream>
using namespace std;
int a, b, d;
int distance(int aru[], int ard[], int d){
  int res = 0;
  for( int i = 0; i < a; i++ ){
    bool f = false;
    for( int j = 0; j < b; j++ ){
      if( abs(aru[i] - ard[j]) <= d ) 
	f = true;
    }
    if( !f ) res++;
  }
  return res;
}
int main(){
  cout << "Ingrese tamano de arreglo uno, dos y d: ";
  cin >> a >> b >> d;
  int aru[a+5], ard[b+5];
  for( int i = 0; i < a; i++ )
    cin >> aru[i];
  for( int i = 0; i < b; i++ )
    cin >> ard[i];
  cout << distance(aru, ard, d) << endl;
  return 0;
}
