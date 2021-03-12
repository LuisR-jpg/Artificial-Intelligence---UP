#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m, k;
  cin >> n >> m >> k;
  swap(n, m);
  int gran = (n+m+10)*150;
  double a[n+3][m+3];
  memset(a, 0, sizeof(a));
  for(int i = 0, x, y; i < k; i++)
    cin >> x >> y, a[n-y][x] = -1;
  for(int i = n; i >= 0; i--){
    double x, y;
    for(int j = 0; j <= m; j++){
      x = y = gran;
      if(a[i][j] < 0) x = a[i+1][j-1] + sqrt(2);
      if(j) x = min(x, a[i][j-1] + 1);
      if(i < n) x = min(x, a[i+1][j] + 1);
      if(x == gran) a[i][j] = 0;
      else a[i][j] = x;
    }
  }
  cout << round(a[0][m]*100);
  return 0;
}
