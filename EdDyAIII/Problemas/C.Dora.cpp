#include <bits/stdc++.h>
using namespace std;
#define f first
#define s second
vector<pair<int, int>> d = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
int add(int a, int b){
  if((a -= 2) == (b -= 2)) return 0;
  return 1 + ((a < 0 && b < 0) || (a >= 0 && b >= 0));
}
int main(){
  int n, m, a, b, x, y;
  cin >> n >> m;
  char s[n+3][m+3];
  int v[n+3][m+3], f[n+3][m+3]; //f: 0 = S, 1 = N, 2 = E, 3 = O
  memset(f, -1, sizeof(f));
  memset(v, -1, sizeof(v));
  for(int i = 0; i < n; i++)
    for(int j = 0; j < m; j++){
      cin >> s[i][j];
      if(s[i][j] == 'S') a = i, b = j;
      if(s[i][j] == 'E') s[i][j] = '.', x = i, y = j;
    }
  queue<pair<int, int>> q;
  q.push({a, b}), v[a][b] = 0, f[a][b] = 1;
  while(q.size()){
    auto p = q.front();
    q.pop();
    for(int i = f[p.f][p.s], j = 0, x, y; j < d.size(); j++, i += (f[p.f][p.s]? 1: -1) + 4, i %= 4)
      if((y = p.f + d[i].f) < n && y >= 0 && (x = p.s + d[i].s) < m && x >= 0 && v[y][x] == -1 && s[y][x] == '.')
	q.push({y, x}), v[y][x] = v[p.f][p.s] + 1 + add(f[p.f][p.s], i), f[y][x] = i;
  }
  cout << v[x][y];
  return 0;
}
