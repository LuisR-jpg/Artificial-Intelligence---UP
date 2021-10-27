#include <bits/stdc++.h>
using namespace std;
using ll = long long;
int main(){
  string a;
  ll r = 0;
  cin >> a;
  int n = a.size() - 1;
  for(int i = 0; i < n + 1; i++){
    a[n - i] -= '0';
    r += a[n - i] * (1 << i);
  }
  cout << r;
  return 0;
}
