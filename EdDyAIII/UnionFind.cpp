//Union-Find Disjoint sets
//
//Connects and tells whether an element is in a set.
//Time Complexity
//	Union: O(1)
//	findSet: ~O(1)
//
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
  UnionFind u(10);
  u.unionSet(0, 1);
  u.unionSet(2, 3);
  u.unionSet(4, 3);
  u.unionSet(0, 4);
  cout << u.isSameSet(1, 3);
  return 0;
}
