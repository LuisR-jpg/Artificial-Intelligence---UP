#include <bits/stdc++.h>
using namespace std;
int main(){
  long long n;
  cin >> n;
  long long vu, bu, ru, vd, bd, rd;
  vu = ru = 1;
  bu = 0;
  for(int i = 1; i < n; i++){
    bd = vu + ru, rd = bu/2 + vu, vd = ru + bu/2;
    vu = vd, bu = bd, ru = rd;
  }
  cout << vu + ru;
  return 0;
}
