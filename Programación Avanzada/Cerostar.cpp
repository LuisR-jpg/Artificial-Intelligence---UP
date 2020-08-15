#include <iostream>
using namespace std;
int main(){
  int a, b;
  cin >> a >> b;
  if( a % 2 && b % 2 )
    for( int i = 0; i < a; i++ )
      for( int j = 0; j < b; j++ )
	cout << (i % 2 && j % 2? "0": "*") << (j+1 == b? "\n": "");
  else cout << "Entrada invalida.";
  return 0;
}
	  
