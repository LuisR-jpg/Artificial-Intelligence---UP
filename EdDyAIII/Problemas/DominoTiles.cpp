//How many ways do you have to fill 2 x n board, with pieces of size 2x1 and 2x2
//Sol: f(n) = f(n - 1) + 2f(n - 2)
#include <bits/stdc++.h>
using namespace std;
int main(){
  int n;
  cin >> n;
  int a = 1; //f(1)
  int b = 3; //f(2)
  int r = (n != 2 && n != 1? 0: (n == 2? b: a));
  for(int i = 3; i <= n; i++){
    r = 2*a + b; 
    a = b;
    b = r;
  }
  cout << r << endl;
  return 0;
}
