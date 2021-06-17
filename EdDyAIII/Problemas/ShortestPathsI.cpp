#include <bits/stdc++.h>
using namespace std;
#define f first
#define s second
typedef long long ll;
typedef pair<ll, ll> ii;
const ll oo = 1e9;
int main(){
  ll n, m, c, u;
  cin >> n >> m;
  vector<vector<ii>> v(n);
  vector<ll> d(n, oo), e(n, -1);
  for(ll a, b, k, i = 0; i < m; i++){
    cin >> a >> b >> k;
    --a, --b;
    v[a].push_back({b, k});
    v[b].push_back({a, k});
  }
  c = 0;
  priority_queue<ii, vector<ii>, greater<ii>> p;
  d[c] = 0, p.push({0, c});
  while(p.size()){
    ii a = p.top();
    p.pop();
    if(a.f > d[a.s]) continue;
    for(ll j = 0; j < v[a.s].size(); j++){
      ii vx = v[a.s][j];
      if(d[a.s] + vx.s < d[vx.f]){
	d[vx.f] = d[a.s] + vx.s;
	e[vx.f] = a.s;
	p.push({d[vx.f], vx.f});
      }
    }
  }
  for(auto x: d)
    cout << x << " ";
  return 0;
}
