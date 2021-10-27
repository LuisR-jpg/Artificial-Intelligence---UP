#include <bits/stdc++.h>
using namespace std;
int main(){
  int n, s = 0;
  cin >> n;
  int a[n+3] = {0};
  for(int i = 0; i < n; s += a[i++])
    cin >> a[i];
  int b[s/2+3] = {0};
  b[0] = 1;
  for(int i = 0; i < n; i++){
    for(int j = s/2+1, c = a[i]; j >= c; j--){
      b[j] += b[j-c];
    }
  }
  int c;
  for(int i = s/2; i >= 0; i--)
    if(b[i]){
      c = i;
      break;
    }
  //cout << c << endl;
  //for(int i = 0; i <= s/2; i++)
  //  cout << b[i] << " ";
  //cout << endl;
  cout << s - 2*c;
  return 0;
}
