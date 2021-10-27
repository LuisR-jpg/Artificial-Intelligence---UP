//Cumulative sum
//	The i-th index contains the sum from [0 - i]
//	Memory. O(n)
//	Time. 
//		Build O(n)
//		Query O(1)
#include <bits/stdc++.h>
using namespace std;
using ll = long long;
int main(){
  int n;
  cin >> n;
  ll a[n+3] = {0};
  for(int i = 0; i < n; i++){
    cin >> a[i];
    if(i) a[i] += a[i-1];
  }
  return 0;
}
