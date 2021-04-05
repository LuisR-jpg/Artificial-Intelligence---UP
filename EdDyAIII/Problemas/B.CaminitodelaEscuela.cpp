#include <bits/stdc++.h>
typedef pair<int, int> ii;
using namespace std;
const int oo = 1e9;
int main(){
  int n, m, c, u;
  vector<vector<pair<int, int>>> v(n);
  for(int a, b, k, i = 0; i < m; i++){
    cin >> a >> b >> k;
    v[a].push_back({b, k});
    v[b].push_back({a, k});
  }
  priority_queue<pair<int, int>
  return 0;
}
