#include <iostream>
using namespace std; 
bool isPrimo(int a){
  for( int i = 2; i < a; i++ )
    if(!( a % i )) return false;
  return true;
}
int main(){
  int suma = 0;
  for( int i = 1; i < 10001; i++ ){
    if( isPrimo(i) ) 
      suma += i;
  }
  cout << suma;
  return 0;
}
