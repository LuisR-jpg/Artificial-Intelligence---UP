#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m;
  cin >> n >> m;
  vector<vector<int>> v(n);
  bool y[n+3] = {0};
  for(int a, b, i = 0; i < m; i++){
    cin >> a >> b;
    v[a].push_back(b), v[b].push_back(a);
  }
  stack<int> s;
  int c = 0, r = 0;
  for(int l = 0, i = 0; i < n; i++){
    if(!y[i]){
      set<int> se;
      c++, l = 1;
      s.push(i);
      while(s.size()){
	int k = s.top();
	se.insert(k);
	s.pop();
	y[k] = 1;
	for(auto x: v[k])
	  if(!y[x])
	    s.push(x);
      }
      r = max(r, (int)se.size());
    }
  }
  cout << c << " " << r;
  return 0;
}
