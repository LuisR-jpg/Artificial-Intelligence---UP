//Edit Distance or Levenshtein's Distance
//	You are allowed to change, add or delete a letter to go from string a to b.
//	This algorithm finds the minimun number of steps
//	Memory and Time O(nm)

#include <bits/stdc++.h>
using namespace std;
int l(string a, string b){
  int m[a.size() + 3][b.size() + 3];
  for(int i = 0; i <= a.size(); i++){
    for(int j = 0; j <= b.size(); j++){
      if(!i) m[i][j] = j;
      else if(!j) m[i][j] = i;
      else if(a[i - 1] == b[j - 1]) m[i][j] = m[i-1][j-1];
      else m[i][j] = min(min(m[i-1][j], m[i][j-1]), m[i-1][j-1]) + 1;
    }
  }
  return m[a.size()][b.size()];
}
int main(){
  string a, b;
  cin >> a >> b;
  cout << l(a, b);
  return 0;
}
