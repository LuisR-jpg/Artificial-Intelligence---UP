#include <bits/stdc++.h>
using namespace std;
class UnionFind{
  private:
    vector<int> parent, rank;
  public: 
    UnionFind(int n){
      rank.assign(n, 0), parent.resize(n);
      for(int i = 0; i < n; i++)
        parent[i] = i;
    }
    int findSet(int i){
      return (i == parent[i]? i: parent[i] = findSet(parent[i]));
    }
    bool isSameSet(int a, int b){
      return findSet(a) == findSet(b);
    }
    void unionSet(int a, int b){
      if(!isSameSet(a, b)){
        int x = findSet(a), y = findSet(b);
        if(rank[x] > rank[y]) parent[y] = x;
        else{
          parent[x] = y;
          if(rank[x] == rank[y]) rank[y]++;
        }
      }
    }
};
int main(){
  cin.tie(0);
  cout.tie(0);
  ios_base::sync_with_stdio(0);
  int n, m;
  cin >> n >> m;
  UnionFind u(n);
  for(int a, b, x; m--; ){
    cin >> x >> a >> b;
    a--, b--;
    if(x) cout << (u.isSameSet(a, b)? "YES": "NO") << "\n";
    else u.unionSet(a, b);
  }
  return 0;
}
