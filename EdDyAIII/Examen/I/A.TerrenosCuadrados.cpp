#include <bits/stdc++.h>
using namespace std;
int main(){
  int n; 
  cin >> n;
  int a[n + 10] = {0};
  for(int i = 1; i <= n; i++) a[i] = 100000;
  for(int i = 1; i*i <= n; i++){
    for(int c = i*i, j = c; j <= n; j++){
      a[j] = min(a[j], a[j - c] + 1);
    }
  }
  cout << a[n];
  return 0;
}
