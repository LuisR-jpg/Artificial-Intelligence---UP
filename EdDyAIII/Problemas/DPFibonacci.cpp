#include <bits/stdc++.h>
using namespace std;
int dp[10000];
int fib(int a){
  if(a < 2) return 1;
  if(dp[a] != -1) return dp[a];
  return dp[a] = (fib(a - 1) + fib(a - 2));
}
int main(){
  memset(dp, -1, sizeof(dp));
  int n;
  cin >> n;
  //cout << 2*fib(n-1) << endl; //Modificación para banderitas
  return 0;
}
