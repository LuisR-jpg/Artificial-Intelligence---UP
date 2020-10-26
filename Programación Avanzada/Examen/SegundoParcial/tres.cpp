#include <iostream>
#include <string>
#include <vector>
using namespace std;
int unos(int e){
  int ans = 0;
  while(e){
    ans += e % 2;
    e /= 2;
  }
  return ans;
}
bool isSetPrime(int x){
  int d = unos(x);
  if( d == 1 ) return 0;
  for(int i = 2; i*i < d; i++)
    if( !(d % i) ) return 0;
  return 1;
}
int main(){
  string a;
  getline(cin, a);
  vector<int> v;
  int ans = 0;
  for(int i = 0, b = -1; i < a.size(); i++){
    string c = "";
    if(i < a.size() - 1 && a[i] >= '0' && a[i] <= '9' && b == -1) b = i;
    else if(b >= 0) c = a.substr(b, i - b), b = -1;
    if(i == a.size() - 1) c += a[a.size() - 1];
    if(c != "") v.push_back(stoi(c));
  }
  for(int i = v[0]; i <= v[1]; i++){
    if(isSetPrime(i)) ans++;
  }
  cout << ans;
  return 0;
}

  
