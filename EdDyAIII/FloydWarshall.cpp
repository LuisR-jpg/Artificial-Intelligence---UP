//NO TERMINADO
//Floyd-Wharshall algorithm. Finds all-pairs shortest paths
//
//Time: O(n3)
//Extra memory: O(1)

#include <bits/stdc++.h>
using namespace std;
int main(){
  for(int k = 0; k < n; k++)
    for(int j = 0; j < n; j++)
      for(int i = 0; i < n; i++)
	w[i][j] = min(w[i][j], w[i][k] + w[k][j]);
  return 0;
}
