#include <bits/stdc++.h>
using namespace std;
int p[30][30], a[30][30], b[30][30], n, rows[500], cols[500], res = 0;
void etiquetauno(){
  int c = 0, f = 1;
  for(int i = 0; i < n; i++){
    if(f) c++, f = 0;
    for(int j = 0; j < n; j++){
      if(!p[i][j]) a[i][j] = c, f = 1, rows[c]++;
      else{
	a[i][j] = 0;
	if(f) c++, f = 0;
      }
    }
  }
  /*
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      cout << a[i][j] << "\t";
    }
    cout << "\n";
  }
  */
}
void etdos(){
  int c = 0, f = 1;
  for(int i = 0; i < n; i++){
    if(f) c++, f = 0;
    for(int j = 0; j < n; j++){
      if(!p[j][i]) b[j][i] = c, f = 1, cols[c]++;
      else{
	b[j][i] = 0;
	if(f) c++, f = 0;
      }
    }
  }
  /*
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      cout << b[i][j] << "\t";
    }
    cout << "\n";
  }
  */
}
int main(){
  for(int i = 0; i < n; i++)
    for(int j = 0; j < n; j++)
      cin >> p[i][j], a[i][j] = p[i][j];
  etiquetauno();
  //cout << "\n";
  etdos();
  /*
  for(int i = 0; i < 30; i++)
    cout << rows[i] << " ";
  cout << endl;
  for(int i = 0; i < 30; i++)
    cout << cols[i] << " ";
  cout << endl;
  */
  int ch = 1;
  while(ch){
    int x, y, mini = INT_MAX;
    ch = 0;
    for(int i = 0; i < n; i++){
      for(int j = 0; j < n; j++){
	if(!p[i][j] && rows[a[i][j]] + cols[b[i][j]] < mini){
	  mini = rows[a[i][j]] + cols[b[i][j]];
	  x = i, y = j;
	}
      }
    }
    for(int i = 0; i < n; i++){
      if(a[x][i] == a[x][y] && !p[x][i]) p[x][i] = 1, ch = 1;
      if(b[i][y] == b[x][y] && !p[i][y]) p[i][y] = 1, ch = 1;
    }
    /*
    for(int i = 0; i < n; i++){
      for(int j = 0; j < n; j++){
	cout << p[i][j] << "\t";
      }
      cout << endl;
    }
    cout << "---------" << endl;
    */
    res += ch;
  }
  cout << res;
  return 0;
}
