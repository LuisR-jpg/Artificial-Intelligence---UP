#include <bits/stdc++.h>
using namespace std;
using ll = long long;
priority_queue<double> h;
double s = 0;
int main(){
  int n, k;
  cin >> n >> k;
  double a;
  for(int i = 0; i < n; i++){
    cin >> a;
    if(h.size() < k || a > -h.top()){
      h.push(-a), s += a;
      if(h.size() > k) s += h.top(), h.pop();
    }
    printf("%0.2lf\n", s/(double)h.size());
  }
  return 0;
}
  
