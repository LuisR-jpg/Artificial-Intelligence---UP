#include <bits/stdc++.h>
using namespace std;
int n, m, da, db, y = 1;
bool v[60][60];
char s[60][60];
int dfs(int i, int j){
  if(i < 0 || i >= n || j < 0 || j >= m || v[i][j] || s[i][j] == '*') 
    return 1000;
  if(s[i][j] == 'E') return y = 0;
  v[i][j] = 1;
  int a, b, c, d;
  a = dfs(i + 1, j);
  b = dfs(i - 1, j);
  c = dfs(i, j + 1);
  d = dfs(i, j - 1);
  return min(min(a, b), min(c, d)) + 1;
  //return min(min(dfs(i + 1, j), dfs(i - 1, j)), min(dfs(i, j + 1), dfs(i, j - 1))) + 1;
}
int main(){
  cin >> n >> m;
  for(int i = 0; i < n; i++){
    for(int j = 0; j < m; j++){
      cin >> s[i][j];
      if(s[i][j] == 'S') da = i, db = j;
    }
  }
  memset(v, 0, sizeof(v));
  int x = dfs(da, db);
  cout << (y? -1: x);
  return 0;
}
