#include <bits/stdc++.h>
using namespace std;
using ll = long long;
const int N = 1e5;
int n, q;
ll t[2 * N];

void build() {
  for (int i = n - 1; i > 0; --i)
    t[i] = t[i<<1] + t[i<<1|1];
}
void modify(int p, int value) {
  for (t[p += n] = value; p > 1; p >>= 1)
    t[p>>1] = t[p] + t[p^1];
}

ll query(int l, int r) {
  ll res = 0;
  for (l += n, r += n; l < r; l >>= 1, r >>= 1) {
    if (l&1) res += t[l++];
    if (r&1) res += t[--r];
  }
  return res;
}
int main(){
  cin.tie(0);
  cout.tie(0);
  ios_base::sync_with_stdio(0);
  cin >> n >> q;
  for(int i = 0; i < n; cin >> t[n + i++]);
  build();
  for(int i = 0, p, x, y; i < q; i++){
    cin >> p >> x >> y;
    if(p) cout << query(x, ++y) << '\n';
    else modify(x, y);
  }
  return 0;
}
