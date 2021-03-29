#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m;
  cin >> n >> m;
  vector<vector<int>> v(n);
  for(int i = 0, a, b; i < m; i++){
    cin >> a >> b;
    v[a].push_back(b), v[b].push_back(a);
  }
  for(int i = 0; i < v.size(); i++){
    cout << i << ": ";
    for(int j = 0; j < v[i].size(); j++)
      cout << v[i][j] << (j + 1 == v[i].size()? "": "->");
    cout << endl;
  }

  return 0;
}
