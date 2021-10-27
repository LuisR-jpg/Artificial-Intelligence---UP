#include <bits/stdc++.h>
using namespace std;
int main(){
  int m, a, b, c;
  cin.tie(0);
  cout.tie(0);
  ios_base::sync_with_stdio(0);
  cin >> m;
  vector<int> v;
  for(int i = 0; i < m; i++){
    cin >> a;
    if(!a) v.clear();
    if(a == 1) v.pop_back();
    if(a == 2) cin >> b, v.push_back(b);
    if(a == 3) cin >> b >> c, v[c] = b;
  }
  if(!v.empty())
    for(auto x: v) 
      cout << x << " ";
  else cout << ":(";
  return 0;
}
