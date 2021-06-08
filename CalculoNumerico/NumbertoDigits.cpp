#include <bits/stdc++.h>
using namespace std;
int main(){
  int num;
  cin >> num;
  vector<int> v;
  while(num){
    v.emplace_back(num % 10);
    num /= 10;
  } 
  reverse(v.begin(), v.end());
  for(int i = 0; i < v.size(); i++)
    cout<< v[i] << " ";
  return 0;
}
