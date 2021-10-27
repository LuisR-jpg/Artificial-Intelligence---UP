#include <bits/stdc++.h>
using namespace std;
int main(){
  int n;
  cin >> n;
  int a[n+3];
  vector<int> l, d, p(n, -1), r; //Lis, inDex, Predecesor, Resultado
  for(int i = 0; i < n; cin >> a[i++]);
  d.push_back(0), l.push_back(a[0]);
  for(int i = 1; i < n; i++){
    int x = a[i];
    if(x < l.back()) p[i] = d.back(), d.push_back(i), l.push_back(x);
    else{
      int j = -1;
      for(int o = l.size(); o >= 1; o /= 2)
	while(j + o < l.size() && l[j + o] > x) j += o;
      l[j+1] = x,  d[j+1] = i, p[i] = (j > -1? d[j]: j);
    }
  }
  cout << l.size() << endl;
  int i = d.back();
  while(i != -1) r.push_back(i), i = p[i];
  sort(r.begin(), r.end());
  for(auto x: r) cout << x << " ";
  return 0;
}
