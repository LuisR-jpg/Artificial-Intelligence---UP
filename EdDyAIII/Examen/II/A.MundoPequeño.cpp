#include <bits/stdc++.h>
using namespace std;
int main(){
  cin.tie(0);
  cout.tie(0);
  ios_base::sync_with_stdio(0);
  char a = 'h';
  int b;
  priority_queue<int> p;
  while(a != '#'){
    cin >> a;
    if(a == '+') cin >> b, p.push(-b);
    else if(a == '-') p.pop();
    else if(a == '?') cout << -p.top() << "\n";
  }
  return 0;
}
