#include <bits/stdc++.h>
using namespace std;
int s;
vector<int> vis(30, 0);
vector<vector<int>> v(30);
void dfs(int n){
  if(vis[n]) return;
  vis[n] = 1, s++;
  for(auto x: v[n]) 
    dfs(x);
}
int main(){
  int n;
  cin >> n;
  char c;
  scanf("%c", &c);
  vector<string> vs;
  while(n--){
    int t = 0, ac = 0;
    string a;
    vis.assign(30, 0), v.assign(30, vector<int>());
    while(getline(cin, a)){
      if(a[0] == '*') break;
      int x = a[1] - 'A', y = a[3] - 'A';
      v[x].push_back(y), v[y].push_back(x);
    }
    getline(cin, a);
    for(int j = 0; j < a.size(); j += 2){
      int i = a[j] - 'A';
      if(!vis[i]){
	s = 0;
	dfs(i);
	if(s == 1) ac++;
	else t++;
      }
    }
    vs.push_back("There are " + to_string(t) + " tree(s) and " + to_string(ac) + " acorn(s).");
  }
  for(auto cad: vs)
    cout << cad << "\n";
  return 0;
}
