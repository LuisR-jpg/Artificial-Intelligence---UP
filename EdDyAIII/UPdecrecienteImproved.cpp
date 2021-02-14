#include <bits/stdc++.h>
using namespace std;
int main(){
  int n;
  cin >> n;
  vector<int> v;
  for(int a, i = 0; i < n; i++){
    cin >> a;
    if(v.empty() || a < v.back()) v.push_back(a);
    else{
      int l = 0, r = v.size() - 1, m;
      while(l != m || l != r || r != m){
        m = (l + r)/2;
        cout << m << " ";
        if(v[m] <= a && (!m || v[m - 1] > a)){
  	break;
        }
        else if(a > v[m]) r = m;
        else l = m;
      }
  	v[m] = a;
      cout << "hola" << endl;
    }
  }
  cout << v.size() << endl;
  return 0;
}
