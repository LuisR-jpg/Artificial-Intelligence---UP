//Kosaraju
//
//Time Complexity: O(V + E) 
//
//Finds SCC in a directed graph.
//Steps: 
//  1. Topological sort
//  2. Transpose
//  3. DFS 

#include <bits/stdc++.h>
using namespace std;
const int mxN = 1003;
int n, m, ma[mxN][mxN], scc;
vector<int> s, v;
void kosaraju(int u, bool f){
  v[u] = 1;
  if(f) cout << u << " ";
  for(int i = 0; i < n; i++)
    if(ma[u][i] && !v[i])
      kosaraju(i, f);
  if(!f) s.push_back(u);
}
int main(){
  cin >> n >> m;
  v.resize(n);
  for(int i = 0, a, b; i < m; i++)
    cin >> a >> b, ma[a][b] = 1;
  for(int i = 0; i < n; i++)
    if(!v[i]) kosaraju(i, 0);
  for(int i = 0; i < n; i++)
    for(int j = 0; j < i; j++)
      swap(ma[i][j], ma[j][i]);
  v.assign(n, 0);
  while(s.size()){
    int i = s.back();
    s.pop_back();
    if(!v[i]){
      cout << "SCC " << ++scc << ": ";
      kosaraju(i, 1);
      cout << "\n";
    }
  }
  return 0;
}

