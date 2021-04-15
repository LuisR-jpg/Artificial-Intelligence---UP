#include <bits/stdc++.h>
#define f first 
#define s second
using namespace std;
int main(){
  int x, y, k;
  unordered_map<int, int> m;
  priority_queue<pair<int, int>> p;
  for(string a;;){
    cin >> a;
    if(a == "#") break;
    cin >> x >> y;
    m.insert({x, y});
    p.push({-y, -x});
  }
  cin >> k;
  while(k--){
    auto b = p.top();
    p.pop();
    cout << -b.s << endl;
    p.push({b.f - m[-b.s], b.s});
  }
  return 0;
}
