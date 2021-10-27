#include <bits/stdc++.h>
using namespace std;
int p[30][30], n;
void etuno(){
  int c = 0, f = 1;
  for(int i = 0; i < n; i++){
    if(f) c++, f = 0;
    for(int j = 0; j < n; j++){
      if(!p[i][j]) cout << c, f = 1;
      else{
	cout << 0;
	if(f) c++, f = 0;
      }
      cout << " ";
    }
    cout << "\n";
  }
}
void etdos(){
  int c = 0, f = 1;
  for(int i = 0; i < n; i++){
    if(f) c++, f = 0;
    for(int j = 0; j < n; j++){
      if(!p[j][i]) p[j][i] = c, f = 1;
      else{
	p[j][i] = 0;
	if(f) c++, f = 0;
      }
    }
  }
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      cout << p[i][j] << " ";
    }
    cout << "\n";
  }
}
int main(){
  cin.tie(0);
  cout.tie(0);
  ios_base::sync_with_stdio(0); cin >> n;
  for(int i = 0; i < n; i++)
    for(int j = 0; j < n; j++)
      cin >> p[i][j];
  etuno();
  cout << "\n";
  etdos();
  return 0;
}
