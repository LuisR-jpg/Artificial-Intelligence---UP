#include <bits/stdc++.h>
using namespace std;
int main(){
  string s;
  getline(cin, s);
  cout << "{";
  for( int i = 0; i < s.size(); i++ ){
    cout << (i? " ": "") << "'" << s[i] << (i == s.size() - 1? "'}": "',");
  }
  return 0;
}
