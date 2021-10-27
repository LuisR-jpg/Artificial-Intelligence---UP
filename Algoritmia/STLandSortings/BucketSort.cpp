#include <bits/stdc++.h>
using namespace std;
const int mN = 1e5;
int main(){
  int n, a[mN] = {0}, mxN = INT_MIN;
  cin >> n;
  for(int i = 0, x; i < n; i++){
    cin >> x;
    a[x]++, mxN = max(mxN, x);
  }
  for(int i = 0; i < 1 + mxN; i++) 
      for(int j = 0; j < a[i]; j++)
	cout << i << " ";
  return 0;
}
