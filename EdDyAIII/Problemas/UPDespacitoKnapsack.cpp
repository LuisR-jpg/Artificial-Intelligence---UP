#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, x;
  cin >> n >> x;
  int c[n+3], m[n+5][x+5] = {0};
  memset(m, 0, sizeof(m));
  for(int i = 0; i < n; cin >> c[i++]);
  for(int i = 1; i <= n; i++){
    for(int j = 1; j <= x; j++){
      m[i][j] = m[i-1][j];
      if(c[i-1] <= j) m[i][j] = max(m[i][j], m[i-1][j-c[i-1]] + c[i-1]);
    }
  }
  cout << m[n][x];
  return 0;
}
