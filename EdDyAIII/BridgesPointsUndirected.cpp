//DFS Variation. Similar to Tarjan
//
//Given n nodes, m edges and an edge list of an undirected graph, this algorithm finds bridges and articulation points.
//Time Complexity: O(V + E)

#include <bits/stdc++.h>
using namespace std;

int c, n, m, root, children;
vector<vector<int>> v, b;
vector<int> num, low, p, pts;


void dfs(int u){
  num[u] = low[u] = c++;
  for(int i = 0, w; i < v[u].size(); i++){
    w = v[u][i];
    if(num[w] == -1){
      p[w] = u;
      dfs(w);
      if(root == u) children++;
      if(low[w] >= num[u]) pts[u] = 1;
      if(low[w] > num[u]) b.push_back({u, w});
      low[u] = min(low[u], low[w]);
    }
    else if(p[u] != w) low[u] = min(low[u], num[w]);
  }
}
int main(){
  cin >> n >> m;
  num.assign(n, -1), p.assign(n, -1), low.resize(n), v.resize(n), pts.resize(n);
  for(int a, b; m--; )
    cin >> a >> b, v[a].push_back(b), v[b].push_back(a);
  for(int i = 0; i < n; i++)
    if(num[i] == -1)
      root = i, children = 0, dfs(i), pts[i] = children > 1;
  cout << "Articulation Points:\n";
  for(int i = 0; i < pts.size(); i++)
    if(pts[i]) 
      cout << i << " ";
  
  cout << "\nThere are " << b.size() << " Bridges:\n";
  for(auto bridge: b)
    cout << bridge[0] << " " << bridge[1] << "\n";
  return 0;
}
