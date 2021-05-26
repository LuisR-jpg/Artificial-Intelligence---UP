#include <bits/stdc++.h>
#define f first
#define s second
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
  int n, m, r = 0;
  cin >> n >> m;
  UnionFind u(n), p(n);
  vector<pair<int, pair<int, int>>> v;
  for(int a, b, k; m--; ){
    cin >> a >> b >> k;
    v.push_back({k, {a, b}});
    p.unionSet(a, b);
  }
  sort(v.begin(), v.end());
  for(auto x: v){
    if(!u.isSameSet(x.s.f, x.s.s) && (p.isSameSet(0, x.s.f) || p.isSameSet(0, x.s.s)))
      u.unionSet(x.s.f, x.s.s), r += x.f;
  }
  cout << r << endl;
  return 0;
}
