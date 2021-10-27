#include <bits/stdc++.h>
using namespace std;
#define f first
#define s second
int main(){
  int cases;
  cin >> cases;
  char c;
  vector<int> ans;
  scanf("%c", &c);
  while(cases--){
    int n, e, t, m, a, b, w;
    cin >> n >> e >> t >> m;
    vector<pair<pair<int, int>, int>> v(m);
    vector<int> d(n, 100000);
    d[--e] = 0;
    for(int i = 0, a, b, w; i < m; i++){
      cin >> a >> b >> w;
      v[i] = {{--b, --a}, w};
    }
    for(int i = 0; i < n; i++){
      for(auto x: v)
	d[x.f.s] = min(d[x.f.s], d[x.f.f] + x.s);
    }
    int r = 0;
    for(auto x: d)
      r += (x <= t);
    ans.push_back(r);
  }
  for(int i = 0; i < ans.size(); i++){
    if(i) cout << "\n";
    cout << ans[i] << "\n";
  }
  return 0;
}
