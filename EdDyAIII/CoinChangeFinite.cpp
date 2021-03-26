//Coin change. Finite coins
//	Input: n and n coins.
//	The i-th square contains the number of ways to sum i.
#include <bits/stdc++.h>
using namespace std;
int main(){
  int n;
  cin >> n;
  int m = 1000; //m represents the maximum possible sum of the problem
  int a[n+3] = {0}, b[m+3] = {0};
  for(int i = 0; i < n; cin >> a[i++]);
  b[0] = 1;
  for(int i = 0; i < n; i++)
    for(int j = m, c = a[i]; j >= c; j--)
      b[j] += b[j-c];
  return 0;  
}
