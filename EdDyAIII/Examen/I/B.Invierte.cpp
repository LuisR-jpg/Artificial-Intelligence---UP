#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, r = 0;
  cin >> n;
  int a[n+3], b[n+3] = {0};
  for(int i = 0; i < n; cin >> a[i++]);
  for(int i = 0; i < n; i++){
    for(int j = 0; j < i; j++){
      if(a[j] <= a[i])
	b[i] = max(b[i], b[j] + 1), r = max(b[i], r);
    }
  }
  cout << r + 1;
  return 0;
}
