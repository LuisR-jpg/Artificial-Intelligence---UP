#include <iostream>
using namespace std;
int main(){
  int x, y, res = 1;
  cin >> x >> y;
  for( int i = 1; i <= y; i++ )
    res *= x;
  cout << res;
  return 0;
}
