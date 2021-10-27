#include <bits/stdc++.h>
using namespace std;
using ll = long long;
int main(){
  double a;
  cin >> a;
  ll x = a;
  for(int i = 15; i >= 0; i--) 
    cout << (bool)(x & (1 << i));
  if((ll)a != a){
    cout << ".";
    for(int i = 0; i < 10; i++){
      a -= (ll)a;
      a *= 2;
      cout << (ll)a;
      if((ll)a) a--;
    }
  }
  return 0;
}
