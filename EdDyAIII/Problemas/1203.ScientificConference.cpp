#include <bits/stdc++.h>
using namespace std;
#define f first
#define s second
int main(){
  int n;
  cin >> n;
  vector<pair<int, int>> v(n);
  for(int i = 0; i < n; i++)
    cin >> v[i].f >> v[i].s;
  sort(v.begin(), v.end());
  int r = 0;
  for(int i = 0, t = 0; i < n; i++){
    if(v[i].f > t) r++, t = v[i].s;
    else if(v[i].s < t) t = v[i].s;
  }
  cout << r;
  return 0;
}
/*
 1 3
 1 5
 3 4
 4 5
 6 7
*/
