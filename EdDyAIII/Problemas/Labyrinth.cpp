#include <bits/stdc++.h>
#define f first
#define s second
using namespace std;
vector<pair<int, int>> d = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
int n, m, a, b, x, y, c = 0;
int mat[1005][1005];
void print(int ca, int cb){
  if(!mat[ca][cb]) return;
  for(int i = 0; i < d.size(); i++){
    auto di = d[i];
    if(mat[ca + di.f][cb + di.s] == mat[ca][cb] - 1){
      print(ca + di.f, cb + di.s);
      if(i == 0) cout << "U";
      if(i == 1) cout << "D";
      if(i == 2) cout << "L";
      if(i == 3) cout << "R";
      break;
    }
  }
}
int main(){
  cin >> n >> m;
  for(int i = 0; i < n; i++){
    for(int j = 0; j < m; j++){
      char c;
      cin >> c;
      mat[i][j] = (c == '#'? -1: 0);
      if(c == 'A') a = i, b = j;
      if(c == 'B') x = i, y = j;
    }
  }
  queue<pair<int, int>> q;
  q.push({a, b});
  while(q.size()){
    auto p = q.front();
    q.pop(), c++;
    for(auto i: d){
      int ca = p.f + i.f, cb = p.s + i.s;
      if(mat[ca][cb] == 0 && (ca != a || cb != b))
	q.push({ca, cb}), mat[ca][cb] = mat[p.f][p.s] + 1;
    }
  }
  if(mat[x][y]){
    cout << "YES" << "\n" << mat[x][y] << "\n";
    print(x, y);
  }
  else cout << "NO";
  return 0;
}
