#include <bits/stdc++.h>
using namespace std;
const int THREADS = 4;
int a[1000];
int f(int j, int l, int r){
  cout << "Hilo " << j << ": [" << l << ", " << r << ") -> ";
  int m = INT_MIN;
  for(int i = l; i < r; i++)
    m = max(a[i], m);
  cout << m << endl;
  return m;
}
int main(){
  int n, gM = INT_MIN;
  cin >> n;
  for(int i = 0; i < n; cin >> a[i++]);
  int p = n/THREADS + (n % THREADS != 0);
  for(int i = 0, j = 0; i < n; i += p)
    gM = max(gM, f(j++, i, min(i + p, n)));
  cout << "Maximo Global: " << gM << endl;
  return 0;
}
