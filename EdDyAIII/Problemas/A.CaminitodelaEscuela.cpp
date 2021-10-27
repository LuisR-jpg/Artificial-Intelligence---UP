#include <bits/stdc++.h>
#define f first
#define s second
using ll = long long;
using namespace std;
int main(){
  int n, m, c, u;
  cin >> n >> m;
  ll a[n+3][n+3];
  memset(a, 0, sizeof(a));
  for(int x, y, k, i = 0; i < m; i++){
    cin >> x >> y >> k;
    a[x][y] = a[y][x] = k;
  }
  cin >> c >> u;
  ll d[n+3];
  for(int i = 0; i < n; i++) d[i] = INT_MAX;
  bool v[n+3] = {0};
  d[c] = 0;
  for(int i = 0, k; i < n; i++){
    for(int j = 0, mi = INT_MAX; j < n; j++)
      if(!v[j] && d[j] < mi)
	mi = d[j], k = j;
    v[k] = 1;
    for(int j = 0; j < n; j++)
      if(!v[j] && a[k][j])
	d[j] = min(d[j], d[k] + a[k][j]);
  }
  cout << c << " - " << u << ": " << d[u] << endl;
  return 0;
}
