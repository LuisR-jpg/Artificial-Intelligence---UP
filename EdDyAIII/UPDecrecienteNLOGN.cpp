#include <bits/stdc++.h>
using namespace std;
int main(){
  int n;
  cin >> n;
  int a[n+3];
  vector<int> l, d, p; //Lis, inDex, Predecesor
  for(int i = 0; i < n; cin >> a[i++]);
  for(int i = 0, x = a[i]; i < n; i++){
    if(!l.size() && x > l.back())
      d.push_back(i), 
      l.push_back(x);
  }
  return 0;
}
