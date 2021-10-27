//Bellman-Ford
//Solves SSSP problems, works with negative weights.
//Complexity: O(nm) -> n nodes, m edges.

//if vector D keeps changing after n iterations, means that there's a negative cycle.
//This code tells you whether there's a negative cycle in the given graph or not. 
//Works with an edge list
#include <bits/stdc++.h>
using namespace std;
#define f first
#define s second
typedef pair<int, int> ii;
typedef long long ll;
int main(){
  int n, m;
  cin >> n >> m;
  vector<pair<ii, int>> v(m);
  vector<int> d(n, 100000);
  for(int a, b, k, i = 0; i < m; i++)
    cin >> a >> b >> k, v[i] = {{a, b}, k};
  bool r = 0;
  d[0] = 0; //Initilize the source
  for(int i = 0; i <= n; i++){
    for(auto x: v){
      auto y = d[x.f.s];
      d[x.f.s] = min(d[x.f.s], d[x.f.f] + x.s);
      if(i == n && y != d[x.f.s]) r = 1;
    }
  }
  cout << (r? "YES": "NO");
  return 0;
}
