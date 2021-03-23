#include <bits/stdc++.h>
using namespace std;
using ll = long long;
priority_queue<double> h;
double avg(){
  vector<double> v;
  double s = 0, t = h.size();
  while(h.size())
    v.push_back(h.top()), h.pop();
  for(auto x: v)
    s -= (double)x, h.push(x);
  return s / t;
}
int main(){
  int n, k;
  cin >> n >> k;
  double a;
  for(int i = 0; i < n; i++){
    cin >> a;
    if(h.size() < k || a > -h.top()){
      h.push(-a);
      if(h.size() > k) h.pop();
    }
    printf("%0.2lf\n", avg());
  }
  return 0;
}
  
