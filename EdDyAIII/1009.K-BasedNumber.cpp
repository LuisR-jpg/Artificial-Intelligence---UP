#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, k;
  cin >> n >> k;
  long long a[n+5][3] = {0};
  a[1][0] = 0, a[1][1] = k - 1;
  for(int i = 2; i <= n; i++){
    a[i][0] = a[i-1][1];
    a[i][1] = a[i-1][0]*(k-1) + a[i-1][1]*(k-1);
  }
  cout << a[n][0] + a[n][1] << endl;
  return 0;
}
