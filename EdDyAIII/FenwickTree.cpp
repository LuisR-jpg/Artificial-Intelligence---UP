//Fenwick or Binary Indexed Tree
//Given information, it evaluates queries and updates values.
//Ez to code

//Memory O(n)
//Time:
//  Build O(nlogn)
//  Query O(logn)
//  Update O(logn)
#include <bits/stdc++.h>
using namespace std;
using ll = long long;
const int MAX = 2e5 + 10;
ll a[MAX], t[MAX], n, q;
void update(int i, int v){
  //i++;
  while(i <= n){
    t[i] += v;
    i += (i & -i);
  }
}
ll query(ll i){
  ll res = 0;
  //i++;
  while(i > 0){
    res += t[i];
    i -= (i & -i);
  }
  return res;
}
void build(){
  for(int i = 0; i < n; i++)
    update(i + 1, a[i]);
}
int main(){
  cin >> n >> q;
  for(int i = 0; i < n; cin >> a[i++]);
  build();
  for(int i = 0, f, g; i < q; i++){
    cin >> f >> g;
    f--;
    if(g - 1 != f) cout << query(g) - query(f) << endl;
    else cout << a[g-1] << endl;
  }
  return 0;
}
