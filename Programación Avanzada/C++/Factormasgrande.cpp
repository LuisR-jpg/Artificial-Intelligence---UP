#include <iostream>
using namespace std;
int main(){
  int n;
  cin >> n;
  for( int i = n/2; i > 0; i-- ) 
    if( !(n % i) ){
      cout << "El factor mas grande es: " << i;
      break;
    }
  return 0;
}
