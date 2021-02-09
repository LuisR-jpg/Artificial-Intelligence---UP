#include <bits/stdc++.h>
using namespace std;
int main(){
  int n;
  cin >> n;
  int arr[n+3];
  vector<int> lis;
  for(int a, i = 0; i < n; i++){
    cin >> a;
    if(lis.empty() || a < lis.back()) lis.push_back(a);
    else{
      int l = 0, r = n.size() - 1, m;
      do{
	m = (l + r) / 2;
	if(m && lis[m] >= 
    }
  }
  return 0;
}
