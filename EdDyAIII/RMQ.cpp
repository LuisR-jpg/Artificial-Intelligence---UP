#include <bits/stdc++.h>
#define N 10001
using namespace std;
int x[N], m[N][25], q, n;
int query(int a, int b){
  int k = (int)log2(b - a + 1);
  int vu = m[a][k], vd = m[b - (1 << k) + 1][k];
  return (x[vu] < x[vd]? x[vu]: x[vd]);
}
int main(){
  cin >> n >> q;
  for(int i = 0; i < n; cin >> x[i++]);
  for(int i = 0; i < n; i++) m[i][0] = i;
  for(int j = 1; (1 << j) <= n; j++)
    for(int i = 0; i + (1 << j) - 1 < n; i++){
      if(x[m[i][j-1]] < x[m[i + (1 << (j - 1))][j - 1]])
	m[i][j] = m[i][j-1];
      else m[i][j] = m[i + (1 << (j - 1))][j - 1];
    }
  for(int i = 0; i < n; i++){
    for(int j = 0; (1 << j) <= n; j++){
      cout << m[i][j] << " ";
    }
    cout << endl;
  }
  for(int i = 0, a, b; i < q; i++)
    cin >> a >> b, cout << query(a, b) << endl;
  return 0;
}
