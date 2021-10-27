#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m, s, e;
  cin >> n >> m;
  vector<vector<int>> v(n);
  for(int i = 0, a, b; i < m; i++){
    cin >> a >> b;
    v[a].push_back(b), v[b].push_back(a);
  }
  cin >> s >> e;
  int p[n+3];
  memset(p, -1, sizeof(p));
  queue<int> q;
  p[s] = 0, q.push(s);
  while(q.size()){
    int x = q.front();
    q.pop();
    for(auto y: v[x]){
      if(p[y] == -1){
	p[y] = p[x] + 1;
      	q.push(y);
      }
    }
  }
  if(p[e] == -1) cout << "Imposible";
  else cout << p[e];
  return 0;
}
