#include <bits/stdc++.h>
#define N 10001
using namespace std;
int x[N], m[N][25], q, n;
int main(){
  cin >> n >> q;
  memset(m, -1, sizeof(m));
  for(int i = 0; i < n; cin >> x[i++]);
  for(int i = 0; i < n; i++) m[i][0] = i;
  for(int j = 1; (1 << j) < n; j++){
    for(int i = 0; i + (1 << j) - 1 < n; i++){
      if(x[m[i][j-1]] < x[m[i + (1 << (j - 1) - 1)][j - 1]])
	m[i][j] = m[i][j-1];
      else m[i][j] = m[i + (1 << (j - 1))][j - 1];
    }
  }
  for(int i = 0; i < n; i++){
    for(int j = 0; (1 << j) < n; j++){
      cout << m[i][j] << " ";
    }
    cout << endl;
  }
  return 0;
}
