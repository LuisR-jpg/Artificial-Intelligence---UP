#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, r = 0, p, act = 1;
  cin >> n;
  int arr[n + 3] = {0}, res[n + 3] = {0}, ind[n + 3] = {0};
  memset(ind, -1, sizeof(ind));
  for(int i = 0; i < n; i++)
    cin >> arr[i];
  for(int i = 0; i < n; i++){
    for(int j = 0; j < i; j++)
      if(arr[j] > arr[i]){
	if(res[j] > res[i])
	  res[i] = res[j], ind[i] = j;
      }
    res[i]++;
    if(res[i] > r) r = res[i], p = i;
  }
  cout << r << endl;
  vector<int> v;
  do{
    v.push_back(p);
    if(ind[p] == -1) break;
    p = ind[p];
  }
  while(1);
  reverse(v.begin(), v.end());
  for(auto x: v)
    cout << x << " ";
  return 0;
}

