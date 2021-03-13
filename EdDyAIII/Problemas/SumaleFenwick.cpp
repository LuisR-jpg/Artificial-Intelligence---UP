#include <bits/stdc++.h>
using namespace std;
using ll = long long;
const int mxN = 1e5 + 10;
ll t[mxN], a[mxN], n, q;
void update(int i, int v){
  i++;
  while(i <= n){
    t[i] += v;
    i += (i & -i);
  }
}
ll query(int i){
  ll res = 0;
  i++;
  while(i > 0){
    res += t[i];
    i -= (i & -i);
  }
  return res;
}
void build(){
  for(int i = 0; i < n; i++)
    update(i, a[i]);
}
int main(){
  cin >> n >> q;
  for(int i = 0; i < n; cin >> a[i++]);
  build();
  for(int x, y, p, i = 0; i < q; i++){
    cin >> p >> x >> y;
    if(p) cout << query(y) - (x? query(--x): 0) << endl;
    else a[x] = y, update(x, 0);
  }
  return 0;
}
