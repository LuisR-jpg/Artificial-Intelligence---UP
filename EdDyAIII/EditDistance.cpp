//NO SIRVE
//
//Edit Distance or Levenshtein's Distance
//	You are allowed to change, add or delete a letter to go from string a to b.
//	This algorithm finds the minimun number of steps
//	Memory and Time O(nm)

#include <bits/stdc++.h>
using namespace std;
int m[1000][1000], o = 0;
string a, b;
int l(string a, string b){
  for(int i = 0; i <= a.size(); i++){
    for(int j = 0; j <= b.size(); j++){
      if(!i) m[i][j] = j;
      else if(!j) m[i][j] = i;
      else if(a[i - 1] == b[j - 1]) m[i][j] = m[i-1][j-1];
      else m[i][j] = min(min(m[i-1][j], m[i][j-1]), m[i-1][j-1]) + 1;
    }
  }
  for(int i = 0; i <= a.size(); i++){
    for(int j = 0; j <= b.size(); j++)
      cout << m[i][j] << " ";
    cout << endl;
  }
  return m[a.size()][b.size()];
}
//CASIIIIIIIIIIII
void r(int i, int j){
  if(!i && !j) return;
  if(i && j && m[i-1][j-1] == m[i][j]){
    r(i-1, j-1);
    cout << b[j-1+o];
  }
  else if(j && m[i][j-1] == m[i][j]-1){
    r(i, j-1);
    o++;
    cout << "Insert " << b[j-1+o];
  }
  else if(i && j && m[i-1][j-1] == m[i][j]-1){
    r(i-1, j-1);
    cout << "Replace " << a[i-1+o] << " -> " << b[j-1+o];
  }
  else if(i && m[i-1][j] == m[i][j] - 1){
    r(i-1, j);
    cout << "Delete " << a[i-1+o];
  }
  cout << endl;
}
int main(){
  cin >> a >> b;
  cout << l(a, b) << endl;
  r(a.size(), b.size());
  return 0;
}
