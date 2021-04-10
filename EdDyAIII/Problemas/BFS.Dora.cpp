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
  for(int i = 0; i < n; i++)
    for(int j = 0; j < m; j++){
      cin >> s[i][j];
      if(s[i][j] == 'S')
	a = i, b = j;
      if(s[i][j] == 'E')
	s[i][j] = '.', x = i, y = j;
    }
  queue<pair<int, pair<int, int>>> q;
  q.push({0, {a, b}});
  while(q.size()){
    //cout << "hola" << endl;
    auto p = q.front();
    //cout << p.s.f << " " << p.s.s << endl;
    q.pop();
    v[p.s.f][p.s.s] = p.f;
    /*
    for(int i = 0; i < n; i++){
      for(int j = 0; j < m; j++){
	cout << v[i][j] << " "; 
      }
      cout << endl;
    }
    */
    if(p.s.f + 1 < n && s[p.s.f + 1][p.s.s] == '.' && v[p.s.f + 1][p.s.s] == -1)
      q.push({p.f + 1, {p.s.f + 1, p.s.s}});
    if(p.s.f - 1 >= 0 && s[p.s.f - 1][p.s.s] == '.' && v[p.s.f - 1][p.s.s] == -1)
      q.push({p.f + 1, {p.s.f - 1, p.s.s}});
    if(p.s.s + 1 < m && s[p.s.f][p.s.s + 1] == '.' && v[p.s.f][p.s.s + 1] == -1)
      q.push({p.f + 1, {p.s.f, p.s.s + 1}});
    if(p.s.s - 1 >= 0 && s[p.s.f][p.s.s - 1] == '.' && v[p.s.f][p.s.s - 1] == -1)
      q.push({p.f + 1, {p.s.f, p.s.s - 1}});
  }
  cout << v[x][y];
  return 0;
}
