#include <iostream>
using namespace std;
int main(){
  int a, b;
  cin >> a >> b;
  if( a % 2 && b % 2 ){
    for( int i = 0; i < a; i++ ){
      for( int j = 0; j < b; j++ ){
	if( !(i % 2) ) cout << "*";
	else{
	  if( !(j % 2) ) cout << "*";
	  else cout << "0";
	}
      }
      cout << endl;
    }
  }
  else cout << "Entrada invalida.";
  return 0;
}
	  
