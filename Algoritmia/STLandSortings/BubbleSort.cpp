#include <bits/stdc++.h>
using namespace std;
int main(){
  int n;
  cin >> n;
  int a[n+3];
  for(int i = 0; i < n; cin >> a[i++]);
  for (int i = 0; i < n-1; i++)     
    for (int j = 0; j < n-i-1; j++) 
      if (a[j] > a[j+1]) 
	swap(a[j], a[j+1]);
  for(int i = 0; i < n; i++)
    cout << a[i] << " ";
  return 0;
}
