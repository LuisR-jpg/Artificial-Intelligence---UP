#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m;
  cin >> n >> m;
  int a[n+3], c[m+3];
  for(int i = 0; i <= m; i++) c[i] = 1000;
  for(int i = 0; i < n; i++) cin >> a[i];
  c[0] = 0;
  for(int i = 0; i < n; i++)
    for(int j = 0; j + a[i] <= m; j++)
      c[j+a[i]] = min(c[j+a[i]], c[j] + 1);
  cout << c[m];
  return 0;
}
