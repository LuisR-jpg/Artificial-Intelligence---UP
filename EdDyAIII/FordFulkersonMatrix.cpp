#include <bits/stdc++.h>
using namespace std;
#define 1500 nMax
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

int fordFulkerson(){
  while(bfs()){
    int k = t, f = INT_MAX;
    while(p[k] != -1){
      f = min(f, r[p[k]][k]);
      k = p[k];
    }
  }
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
