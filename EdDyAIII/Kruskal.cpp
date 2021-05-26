//Kruskal's Algorithm
//	Algorithm that finds the minimum spanning tree of a graph in O(m), given m edges.
//	Uses UnionFind

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
  int n, m, wMST = 0;
  cin >> n >> m; //n nodes, m edges
  vector<pair<int, pair<int, int>>> eL; //Edge List
  for(int a, b, k, i = 0; i < m; i++){
    cin >> a >> b >> k; //Edge whose weigth is k and connects a - b
    eL.push_back({k, {a, b}});
  }
  sort(eL.begin(), eL.end()); 
  UnionFind u(n);
  for(auto e: eL) //Adds lightest edge that doesn't generate a cycle
    if(!u.isSameSet(e.s.f, e.s.s))
      u.unionSet(e.s.f, e.s.s), wMST += e.f;
  cout << "Weigth of MST: " << wMST << endl;  
  return 0;
}

