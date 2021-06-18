#include <bits/stdc++.h>
using namespace std;
int p[30][30], a[30][30], b[30][30], n, c[500][500], r[500][500], cont = 0, s, t;
void etuno(){
  int f = 1;
  for(int i = 0; i < n; i++){
    if(f) cont++, f = 0;
    for(int j = 0; j < n; j++){
      if(!p[i][j]) a[i][j] = cont, f = 1;
      else{
	a[i][j] = 0;
	if(f) cont++, f = 0;
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
  int f = 1;
  for(int i = 0; i < n; i++){
    if(f) cont++, f = 0;
    for(int j = 0; j < n; j++){
      if(!p[j][i]) b[j][i] = cont, f = 1;
      else{
	b[j][i] = 0;
	if(f) cont++, f = 0;
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


vector<int> par, v; //Parents, visited

bool bfs(){
  par.assign(cont, -1), v.assign(cont, 0);
  queue<int> q;
  v[s] = 1, q.push(s);
  while(q.size()){
    int k = q.front();
    q.pop();
    for(int i = 0; i < cont; i++){
      if(r[k][i] > 0 && !v[i])
	v[i] = 1, q.push(i), par[i] = k;
    }
  }
  return v[t] == 1;
}

void path(int x){
  if(x == -1) return;
  path(par[x]);
  cout << x << " ";
}

int fordFulkerson(){
  int fM = 0;
  while(bfs()){
    int k = t, f = INT_MAX;
    while(par[k] != -1){
      f = min(f, r[par[k]][k]);
      k = par[k];
    }
    /*
    cout << f << ": ";
    path(t), cout << endl;
    */
    k = t;
    while(par[k] != -1){
      r[par[k]][k] -= f;
      r[k][par[k]] += f;
      k = par[k];
    }
    fM += f;
  }
  return fM;
}


int main(){
  cin.tie(0);
  cout.tie(0);
  ios_base::sync_with_stdio(0);
  cin >> n;
  for(int i = 0; i < n; i++)
    for(int j = 0; j < n; j++)
      cin >> p[i][j];
  etuno();
  etdos();
  s = cont + 1, t = cont + 2;
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      if(!p[i][j]){
	c[a[i][j]][b[i][j]] = 1;
	c[s][a[i][j]] = 1;
	c[b[i][j]][t] = 1;
	r[a[i][j]][b[i][j]] = 1;
	r[s][a[i][j]] = 1;
	r[b[i][j]][t] = 1;
      }
    }
  }
  cont += 10;
  /*
  for(int i = 0; i < cont; i++){
    for(int j = 0; j < cont; j++){
      cout << c[i][j] << " ";
    }
    cout << endl;
  }
  */
  cout << fordFulkerson();
  return 0;
}
