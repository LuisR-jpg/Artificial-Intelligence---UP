#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m;
  cin >> n >> m;
  set<string> s;
  string a;
  for(int i = 0; i < n; i++) cin >> a, s.insert(a);
  for(int i = 0; i < m; i++) cin >> a, cout << (s.count(a)? "YES": "NO") << endl;
  return 0;
}
