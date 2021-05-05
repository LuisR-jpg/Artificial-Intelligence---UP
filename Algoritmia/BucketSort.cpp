#include <bits/stdc++.h>
using namespace std;
const int mN = 1e5;
int main(){
  int n, a[mN] = {0}, mxN = INT_MIN;
  for(int i = 0, x; i < n; i++){
    cin >> x;
    a[x]++, mxN = max(mxN, x);
  }
  for(int i = 0; i < mN; i++) 
    if(a[i])
      for(int j = 0; j < mxN; j++)
	cout << i << " ";
  return 0;
}
