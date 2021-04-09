#include <bits/stdc++.h>
using namespace std;
int n, m, a, b;
char s[60][60];
void dfs(int i, int j){
  if(i < 0 || i >= n || j < 0 || j >= m || s[i][j] == '#' || s[i][j] == '*')
    return;
  s[i][j] = '#';
  dfs(i + 1, j);
  dfs(i - 1, j);
  dfs(i, j + 1);
  dfs(i, j - 1);
}
int main(){
  cin >> n >> m;
  for(int i = 0; i < n; i++){
    for(int j = 0; j < m; j++){
      cin >> s[i][j];
      if(s[i][j] == '#') 
	s[i][j] = '.', a = i, b = j;
    }
  }
  bool v[n+3][m+3];
  memset(v, 0, sizeof(v));
  dfs(a, b);
  for(int i = 0; i < n; i++){
    for(int j = 0; j < m; j++)
      cout << s[i][j];
    cout << endl;
  }
  return 0;
}
