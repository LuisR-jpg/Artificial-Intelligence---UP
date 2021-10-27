///How many numbers of n digits have no pair of even numbers?
//11 and 23 are valid and 122 and 48 are not.
///f(n) = f_e(n) + f_o(n);
//f_e(n) = 5*f_o(n - 1)
//f_o(n) = 5*f_o(n - 1) + 5*f_e(n - 1)
#include <bits/stdc++.h>
using namespace std;
int num[10000][2]; //0 pares, 1 impares
int main(){
  memset(num, -1, sizeof(num));
  int n;
  cin >> n;
  num[1][0] = 4, num[1][1] = 5;
  for(int i = 2; i <= n; i++){
    num[i][0] = 5*num[i-1][1];
    num[i][1] = 5*num[i-1][0] + 5*num[i-1][1];
  }
  if(n <= 1) cout << 10;
  else cout << num[n][0] + num[n][1];
  return 0;
}
