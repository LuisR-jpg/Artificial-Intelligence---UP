#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m;
  cin >> n >> m;
  int a[n+3] = {0}, b[m+3] = {0};
  for(int i = 0; i < n; i++) cin >> a[i];
  b[0] = 1;
  for(int i = 0; i < n; i++)
    for(int j = m, c = a[i]; j >= c; j--)
      b[j] += b[j-c];
  for(int i = m; i >= 0; i--)
    if(b[i]){
      cout << i;
      return 0;
    }
  return 0;  
}
