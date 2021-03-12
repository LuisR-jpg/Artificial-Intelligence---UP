#include <bits/stdc++.h>
using namespace std;
#define MAX 1000000007
long a, b, n, m[50005][2];
long f(int t, int w){
  if(t > n) return 0;
  if(t == n) return 1;
  if(m[t][w] != -1) return m[t][w];
  long ans = 0;
  for(int i = 1; i <= (w? b: a); i++){
    ans += f(t + i, !w) % MAX;
    ans %= MAX;
  }
  return m[t][w] = ans;
}
int main(){
  cin >> n >> a >> b;
  memset(m, -1, sizeof(m));
  cout << (f(0, 0) + f(0, 1)) % MAX;
  return 0;
}
