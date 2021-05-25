#include <bits/stdc++.h>
using namespace std;
int n, m, c = 0;
vector<vector<int>> v, b;
vector<int> num, low, p;
void bridges(int u){
  num[u] = low[u] = c++;
  for(int w, i = 0; i < v[u].size(); i++){
    w = v[u][i];
    if(num[w] == -1){
      p[w] = u;
      bridges(w);
      if(low[w] > num[u])
	b.push_back({u, w});
      low[u] = min(low[u], low[w]);
    }
    else if(p[u] != w) 
      low[u] = min(low[u], num[w]);
  }
}
int main(){
  cin >> n >> m;
  v.resize(n), num.assign(n, -1), low.resize(n), p.assign(n, -1);
  for(int a, b; m--;)
    cin >> a >> b, v[a].push_back(b), v[b].push_back(a);
  for(int i = 0; i < n; i++)
    if(num[i] == -1) 
      bridges(i);
  cout << b.size() << "\n";
  for(auto puente: b)
    cout << puente[0] << " - " << puente[1] << "\n";
  return 0;
}
