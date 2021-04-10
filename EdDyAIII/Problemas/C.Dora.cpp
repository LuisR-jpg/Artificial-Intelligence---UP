#include <bits/stdc++.h>
using namespace std;
#define f first
#define s second
vector<pair<int, int>> d = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
int main(){
  int n, m, a, b, x, y;
  cin >> n >> m;
  char s[n+3][m+3];
  int v[n+3][m+3];
  memset(v, -1, sizeof(v));
  for(int i = 0; i < n; i++)
    for(int j = 0; j < m; j++){
      cin >> s[i][j];
      if(s[i][j] == 'S') a = i, b = j;
      if(s[i][j] == 'E') s[i][j] = '.', x = i, y = j;
    }
  queue<pair<int, int>> q;
  q.push({a, b}), v[a][b] = 0;
  while(q.size()){
    auto p = q.front();
    q.pop();
    for(int i = 0, x, y; i < d.size(); i++)
      if((y = p.f + d[i].f) < n && y >= 0 && (x = p.s + d[i].s) < m && x >= 0 && v[y][x] == -1 && s[y][x] == '.')
	q.push({y, x}), v[y][x] = v[p.f][p.s] + 1;
  }
  cout << v[x][y];
  return 0;
}
