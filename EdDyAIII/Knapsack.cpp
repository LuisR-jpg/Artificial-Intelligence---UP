//Knapsack Problem
//	Given the weight and value of n objects and the capacity of the thief's backpack.
//	Help the thief to steal the maximum value that his backpack is capable to carry.
//	Memory and Time complexity O(nx) //Where n is the number of objects and x is the capacity of the backpack

#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, x;
  cin >> n >> x;
  int c[n+3][3], m[n+5][x+5] = {0};
  memset(m, 0, sizeof(m));
  for(int i = 0; i < 2*n; cin >> c[i%n][i++/n]);
  for(int i = 1; i <= n; i++){
    for(int j = 1; j <= x; j++){
      m[i][j] = m[i-1][j];
      if(c[i-1][0] <= j) m[i][j] = max(m[i][j], m[i-1][j-c[i-1][0]] + c[i-1][1]);
    }
  }
  cout << m[n][x];
  return 0;
}
