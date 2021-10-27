//https://www.hackerrank.com/challenges/find-the-running-median/problem
//Returns the median of an array that is constantly growing.
//Works with heap
//Memory O(n), Time O(nlogn)
#include <bits/stdc++.h>
using namespace std;
priority_queue<int> l, r;
int main(){
  double m;
  int n;
  cin >> n;
  for(int i = 0, a; i < n; i++){
    cin >> a;
    if(!i) l.push(a), m = a;
    else if(a > l.top()) r.push(-a);
    else l.push(a);
    if((int)l.size() - (int)r.size() > 1) r.push(-l.top()), l.pop();
    else if((int)r.size() - (int)l.size() > 1) l.push(-r.top()), r.pop();
    if(l.size() > r.size()) m = l.top();
    else if(r.size() > l.size()) m = -r.top();
    else m = ((double)l.top() - (double)r.top())/2;
    printf("%0.1lf\n", m);
  }
  return 0;
}
