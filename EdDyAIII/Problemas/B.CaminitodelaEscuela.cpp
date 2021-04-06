#include <bits/stdc++.h>
using namespace std;
#define s second
#define f first
typedef pair<int, int> ii;
typedef long long ll;
const int oo = 1e9;
int main(){
  int n, m, c, u;
  cin >> n >> m;
  vector<vector<ii>> v(n);
  vector<int> d(n, oo);
  for(int a, b, k, i = 0; i < m; i++){
    cin >> a >> b >> k;
    v[a].push_back({b, k});
    v[b].push_back({a, k});
  }
  cin >> c >> u;
  cout << endl;
  for(int i = 0; i < v.size(); i++){
    for(int j = 0; j < v[i].size(); j++){
      cout << v[i][j].f << " " << v[i][j].s << ", ";
    }
    cout << endl;
  }
  priority_queue<ii, vector<ii>, greater<ii>> p;
  d[c] = 0, p.push({0, c});
  while(p.size()){
    ii a = p.top();
    p.pop();
    if(a.f > d[a.s]) continue;
    for(int j = 0; j < v[a.s].size(); j++){
      ii vx = v[a.s][j];
      if(d[a.s] + vx.s < d[a.f]){
	d[vx.f] = d[a.s] + vx.s;
	p.push({d[vx.f], vx.f});
      }
    }
  }
  for(auto x: d) cout << x << " ";
  return 0;
}
