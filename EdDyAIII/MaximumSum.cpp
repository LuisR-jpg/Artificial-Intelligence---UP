//Maximum Sum
//	Given an array of elements, this algorithms finds the value of the subarray which sum is maximum.
//	Time and Memory complexity O(n)
#include <bits/stdc++.h>
using namespace std;
int main(){
    int n;
  cin >> n;
  int a[n+3], maxV = INT_MIN;
  for(int i = 0; i < n; cin >> a[i++]);
  for(int i = 0, s = 0; i < n; i++)
    s = max(a[i], a[i] + s), maxV = max(maxV, s);
  cout << maxV;
  return 0;
}
