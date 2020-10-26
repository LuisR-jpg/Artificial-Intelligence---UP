#include <iostream>
#include <string>
#include <vector>
using namespace std;
int pot(int x){
  int ans = 1;
  for(int i = 0; i < x; i++)
    ans *= 2;
  return ans;
}
int main(){
  string s;
  getline(cin, s);
  vector<int> v;
  for(char i: s)
    if(i == '0' || i == '1') 
      v.push_back(i - '0');
  long res = 0;
  for(int i = v.size() - 1, a = 0; i >= 0; i--, a++)
    res += v[i] * pot(a);
  cout << res;
  return 0;
}
