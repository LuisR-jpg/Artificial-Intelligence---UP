#include <bits/stdc++.h>
using namespace std;
string ntoB(){
  int n;
  cin >> n;
  string s = "";
  while(n){
    s = to_string(n % 2) + s;
    n /= 2;
  }
  return s;
}
long long btoD(string s){
  string s;
  cin >> s;
  int n = s.size();
  long long res = 0, m = 1;
  for(int i = n - 1; i >= 0; i--, m <<= 1)
    if(s[i] == '1') res += m;
}
int main(){
  return 0;
}
