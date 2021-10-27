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
    unordered_set<int> getSets(){
      unordered_set<int> s;
      for(int i = 0; i < (int)parent.size(); i++)
	s.insert(findSet(i));
      return s;
    }
};
int main(){
  int n, m;
  cin >> n >> m;
  UnionFind u(n);
  for(int i = 0, a, b; i < m; i++){
    cin >> a >> b;
    u.unionSet(--a, --b);
  }
  auto s = u.getSets();
  int c = 0, y;
  cout << s.size() - 1 << endl;
  for(auto x: s){
    if(!c++) y = x;
    else cout << 1 + y << " " << 1 + x << "\n", y = x;
  }
  return 0;
}
