//Matrix Maximum Sum
//	Finds the maximum sum of the submatrix inside the original
//	Memory O(n^2)
//	Time O(n^3)
#include <bits/stdc++.h>
using namespace std;
int main(){
  int n;
  cin >> n;
  int a[n+3][n+3];
  for(int i = 0; i < n; i++)
   for(int j = 0; j < n; j++)
      cin >> a[i][j], a[i][j] += (i? a[i-1][j]: 0);
  int maxV = -200;
  for(int i = 0; i < n; i++)
    for(int j = i; j < n; j++)
      for(int k = 0, s = 0; k < n; k++){
	int x = a[j][k];
	if(i) x -= a[i-1][k];
	s += x;
	s = max(s, x);
	maxV = max(maxV, s);
      }
  cout << maxV;
  return 0;
}
