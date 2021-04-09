#include <bits/stdc++.h>
using namespace std;
#define f first
#define s second
typedef pair<int, int> ii;
typedef long long ll;
int main(){
  int n, m;
  cin >> n >> m;
  vector<pair<ii, int>> v(m);
  vector<int> d(n, 100000);
  for(int a, b, k, i = 0; i < m; i++)
    cin >> a >> b >> k, v[i] = {{a, b}, k};
  bool r = 0;
  for(int i = 0; i <= n; i++){
    for(auto x: v){
      auto y = d[x.f.s];
      d[x.f.s] = min(d[x.f.s], d[x.f.f] + x.s);
      if(i == n && y != d[x.f.s]) r = 1;
    }
  }
  cout << (r? "YES": "NO");
  return 0;
}
