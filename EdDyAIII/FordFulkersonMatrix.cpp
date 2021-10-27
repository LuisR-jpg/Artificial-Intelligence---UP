//	Ford Fulkerson
//Finds the maximum flow that can be send from a source node to the sink node.
//Steps.
//	1. Find Augmenting Path
//	2. Find max flow in the path
//	3. Update capacites with the max flow
//
//Complexity
//	Time: O(f*n^2) Where f is the max flow and n is the number of nodes.
//	Memory: O(n^2)

#include <bits/stdc++.h>
using namespace std;
const int nMax = 1000;
int c[nMax][nMax], r[nMax][nMax]; //Original matrix and residual graph
int n, m, s, t; //nodes, edges, source, sink
vector<int> p, v; //Parents, visited

bool bfs(){
  p.assign(n, -1), v.assign(n, 0);
  queue<int> q;
  v[s] = 1, q.push(s);
  while(q.size()){
    int k = q.front();
    q.pop();
    for(int i = 0; i < n; i++)
      if(r[k][i] > 0 && !v[i])
	v[i] = 1, q.push(i), p[i] = k;
  }
  return v[t] == 1;
}

void path(int x){
  if(x == -1) return;
  path(p[x]);
  cout << x << " ";
}

int fordFulkerson(){
  int fM = 0;
  while(bfs()){
    int k = t, f = INT_MAX;
    while(p[k] != -1){
      f = min(f, r[p[k]][k]);
      k = p[k];
    }
    cout << f << ": ";
    path(t), cout << endl;
    k = t;
    while(p[k] != -1){
      r[p[k]][k] -= f;
      r[k][p[k]] += f;
      k = p[k];
    }
    fM += f;
  }
  return fM;
}

int main(){
  cin >> n >> m >> s >> t;
  for(int i = 0, a, b, k; i < m; i++){
    cin >> a >> b >> k;
    c[a][b] = k;
    r[a][b] = c[a][b];
  }
  cout << "The max flow is: " << fordFulkerson();
  return 0;
}
