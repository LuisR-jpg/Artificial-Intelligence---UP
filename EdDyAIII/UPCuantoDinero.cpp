#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m;
  cin >> n >> m;
  int a[n+3], b[m+3] = {0}, c[m+3] = {1000};
  for(int i = 0; i <= m; i++) c[i] = 1000;
  for(int i = 0; i < n; i++) cin >> a[i];
  b[0] = 1, c[0] = 0;
  for(int i = 0; i < n; i++){
    for(int j = 0; j + a[i] <= m; j++){
      b[j+a[i]] += b[j];
      c[j+a[i]] = min(c[j+a[i]], c[j] + 1);
    }
  }
  //for(int i = 0; i <= m; i++) cout << c[i] << " ";
  cout << c[m] << endl;
  return 0;
}
