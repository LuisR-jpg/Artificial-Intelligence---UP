#include <bits/stdc++.h>
using namespace std;
int main(){
  string s;
  cin >> s;
  for( int i = 0; i < s.size(); i++ )
    cout << char(s[i] - 3);
  return 0;
}
