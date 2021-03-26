//Longest common subsequence
//Given two arrays, finds the longest common subsequence in case only removing is allowed.
//Let n and m be the lenghts of the arrays.
//Memory O(nm)
//Time O(nm)
#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m;
  cin >> n >> m;
  int a[n+3], b[m+3], dp[n + 3][m + 3];
  memset(dp, 0, sizeof(dp));
  for(int i = 0; i < n; i++)
    cin >> a[i];
  for(int j = 0; j < m; j++)
    cin >> b[j];
  for(int i = 0; i < n; i++){
    for(int j = 0, x; j < m; j++){
      x = (a[i] == b[j]? dp[i][j] + 1: max(dp[i][j + 1], dp[i + 1][j]));
      dp[i+1][j+1] = x;
    }
  }
  cout << dp[n][m];
  return 0;
}
