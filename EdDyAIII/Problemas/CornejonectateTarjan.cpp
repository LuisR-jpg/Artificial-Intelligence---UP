#include <bits/stdc++.h>
using namespace std;
int n, m, c = 0, scc = 0, mi = INT_MAX, ma = INT_MIN;
vector<int> vis, num, low, s;
vector<vector<int>> v;
void tarjan(int u){
  num[u] = low[u] = c++, vis[u] = 1, s.push_back(u);
  for(int w, i = 0; i < v[u].size(); i++){
    w = v[u][i];
    if(num[w] == -1) tarjan(w);
    if(vis[w]) low[u] = min(low[u], low[w]);
  }
  if(low[u] == num[u]){
    int w, t = 0;
    do w = s.back(), s.pop_back(), vis[w] = 0, t++;
    while(w != u);
    mi = min(mi, t), ma = max(ma, t), scc++;
  }
}
int main(){
  cin >> n >> m;
  vis.resize(n), num.resize(n, -1), low.resize(n), v.resize(n);
  for(int i = 0, a, b; i < m; i++)
    cin >> a >> b, v[a].push_back(b);
  for(int i = 0; i < n; i++)
    if(num[i] == -1) 
      tarjan(i);
  cout << scc << " " << mi << " " << ma;
  return 0;
}
  
