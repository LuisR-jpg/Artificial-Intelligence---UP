#include <bits/stdc++.h>
using namespace std;
#define f first
#define s second
int main(){
  int n, m, a, b, x, y;
  cin >> n >> m;
  char s[n+3][m+3];
  int v[n+3][m+3];
  memset(v, -1, sizeof(v));
  for(int i = 0; i < n; i++){
    for(int j = 0; j < m; j++){
      cin >> s[i][j];
      if(s[i][j] == 'S')
	a = i, b = j;
      if(s[i][j] == 'E')
	s[i][j] = '.', x = i, y = j;
    }
  }
  queue<pair<int, int>> q;
  q.push({a, b}), v[a][b] = 0;
  while(q.size()){
    auto p = q.front();
    q.pop();
    if(p.f + 1 < n && s[p.f + 1][p.s] == '.' && !(v[p.f + 1][p.s] + 1))
      q.push({p.f + 1, p.s}), v[p.f + 1][p.s] = v[p.f][p.s] + 1;
    if(p.f > 0 && s[p.f - 1][p.s] == '.' && !(v[p.f - 1][p.s] + 1))
      q.push({p.f - 1, p.s}), v[p.f - 1][p.s] = v[p.f][p.s] + 1;
    if(p.s + 1 < m && s[p.f][p.s + 1] == '.' && !(v[p.f][p.s + 1] + 1))
      q.push({p.f, p.s + 1}), v[p.f][p.s + 1] = v[p.f][p.s] + 1;
    if(p.s > 0 && s[p.f][p.s - 1] == '.' && !(v[p.f][p.s - 1] + 1))
      q.push({p.f, p.s - 1}), v[p.f][p.s - 1] = v[p.f][p.s] + 1;
  }
  cout << v[x][y];
  return 0;
}
