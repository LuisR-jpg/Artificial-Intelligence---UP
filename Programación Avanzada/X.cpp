#include <iostream>
using namespace std;
int main(){
  int h, a = 0, b; 
  cin >> h;
  b = 2*h-2;
  for( int i = 0; i < h*2-1; i++ ){
    for( int j = 0; j < h*2-1; j++ )
      cout << (j == a || j == b? '*': ' ');
    a = i < h-1? ++a: --a;
    b = i < h-1? --b: ++b;
    cout << endl;
  }
  return 0;
}
