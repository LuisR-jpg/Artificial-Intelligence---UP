#include <iostream>
#include <vector>
using namespace std;
int main(){
  int n;
  vector<int> v;
  cin >> n;
  for( int i = 0, aux; i < n; i++ ){
    cin >> aux;
    v.push_back(aux);
  }
  int a = 0, b = v.size() - 1;
  if( v.size() < 3 ){
    cout << -1;
    return 0;
  }
  for( int i = 0; i < v.size(); i++ ){
    if( a < v.size() - 1 && v[a + 1] > v[a] ) a++;
    if( b && v[b - 1] > v[b] ) b--;
  }
  if( a == b ) cout << a;
  else cout << -1;
  return 0;
}

