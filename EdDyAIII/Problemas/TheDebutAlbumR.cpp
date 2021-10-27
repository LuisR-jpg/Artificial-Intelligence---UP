#include <bits/stdc++.h>
using namespace std;
using ll = long long;
const int MOD = 1e9 + 7;
int n, a, b, m[50009][3];
ll f(int t, int w){
  if(t > n) return 0;
  if(t == n) return 1;
  if(m[t][w] != -1) return m[t][w];
  ll r = 0;
  for(int i = 1; i <= (w? a: b); i++)
    r += f(t + i, !w), r %= MOD;
  return m[t][w] = r;
}
int main(){
  memset(m, -1, sizeof(m));
  cin >> n >> a >> b;
  cout << (f(0, 0) + f(0, 1)) % MOD;
  return 0;
}
