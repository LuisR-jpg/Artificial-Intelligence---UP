#include <bits/stdc++.h>
#define f first
#define s second
using namespace std;
int main(){
  ifstream jaja;
  jaja.open("input.txt", ios::in);
  vector<pair<string, string>> v;
  string s, r;
  while(getline(jaja, s)){
    getline(jaja, r);
    v.emplace_back(s, r);
  }
  jaja.close();
  for(char c; ; scanf("%c", &c)){
    int i = rand() % v.size();
    cout << endl << v[i].f;
    scanf("%c", &c);
    cout << v[i].s;
  }
  return 0;
}
