#include <bits/stdc++.h>
using namespace std;
const int nm = 1e9;
int main(){
  freopen("d.s.in", "w", stdout);
  srand(time(NULL));
  int m = 1000000, n = 0;
  cout << m << endl;
  for(int i = 0; i < m; i++){
    int a = rand() % 4;
    if(!n && a) a = 2;
    cout << a;
    if(!a) n = 0;
    if(a == 1) n--;
    if(a == 2) n++, cout << " " << rand() % nm;
    if(a == 3) cout << " " << rand() % nm << " " << rand() % n;
    cout << "\n";
  }
  return 0;
}
