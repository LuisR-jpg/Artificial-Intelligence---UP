//Tarjan's Algorithm.
//Algorithm to find Strongly Connected Components in a directed graph of n nodes and m edges
//
//Time Complexity: O(V + E)

#include <bits/stdc++.h>
using namespace std;
int n, m, c = 0, scc = 0;
vector<int> num, low, vis;
vector<vector<int>> v;
stack<int> s;
void tarjan(int u){
  num[u] = low[u] = c++, vis[u] = 1, s.push(u);
  for(int i = 0; i < v[u].size(); i++){
    int w = v[u][i];
    if(num[w] == -1) tarjan(w);
    if(vis[w]) low[u] = min(low[u], low[w]);
  }
  if(low[u] == num[u]){
    cout << "SCC " << ++scc << ": ";
    int w;
    do{
      w = s.top(), s.pop(), vis[w] = 0;
      cout << w << " ";
    }
    while(w != u);
    cout << endl;
  }
}
int main(){
  cin >> n >> m;
  v.resize(n), num.assign(n, -1), low.resize(n), vis.resize(n);
  for(int i = 0, a, b; i < m; i++)
    cin >> a >> b, v[a].push_back(b);
  for(int i = 0; i < n; i++)
    if(num[i] == -1) 
      tarjan(i);
  return 0;
}
  

