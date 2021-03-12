#include <bits/stdc++.h>
using namespace std;
int a[100];
long long fib(int n){
  if(n < 3) return 1;
  if(a[n]) return a[n];
  return a[n] = fib(n-1) + fib(n-2);
}
int main(){
  int n;
  cin >> n;
  memset(a, 0, sizeof(a));
  cout << 2*fib(n) << endl;
  return 0;
}
