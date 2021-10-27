#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, m;
  cin >> n >> m;
  bool x[n + 3][n + 3];
  memset(x, 0, sizeof(x));
  for(int i = 0, a, b; i < m; i++)
    cin >> a >> b, x[a][b] = x[b][a] = 1;
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++)
      cout << x[i][j] << " ";
    cout << endl;
  }
  return 0;
}
