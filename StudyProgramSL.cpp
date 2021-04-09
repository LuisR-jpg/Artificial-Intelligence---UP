#include <bits/stdc++.h>
using namespace std; 
int main(){
  vector<string> v;
  string a;
  for(int i = 0; i < 7; i++){
    getline(cin, a);
    v.push_back(a);
  }
  cout << endl;
  for(char c;; scanf("%c", &c)){
    cout << v[rand() % v.size()] << endl;
  }
  return 0;
}
