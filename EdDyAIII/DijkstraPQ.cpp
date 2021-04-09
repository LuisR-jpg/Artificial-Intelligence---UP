//Dijkstra. 
//Solves SSSP Problemas (single source shortest paths)
//Finds shortest path between two nodes and prints every node used

//Time. O(nlogn) 
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
  vector<int> d(n, oo), e(n, -1);
  for(int a, b, k, i = 0; i < m; i++){
    cin >> a >> b >> k;
    v[a].push_back({b, k});
    v[b].push_back({a, k});
  }
  cin >> c >> u;
  priority_queue<ii, vector<ii>, greater<ii>> p;
  d[c] = 0, p.push({0, c});
  while(p.size()){
    ii a = p.top();
    p.pop();
    if(a.f > d[a.s]) continue;
    for(int j = 0; j < v[a.s].size(); j++){
      ii vx = v[a.s][j];
      if(d[a.s] + vx.s < d[vx.f]){
	d[vx.f] = d[a.s] + vx.s;
	e[vx.f] = a.s;
	p.push({d[vx.f], vx.f});
      }
    }
  }
  cout << d[u] << endl;
  vector<int> r;
  while(u != -1){
    r.push_back(u);
    u = e[u];
  }
  for(int i = r.size() - 1; i >= 0; i--)
    cout << r[i] << " ";
  return 0;
}
