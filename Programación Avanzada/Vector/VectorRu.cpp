#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int a;
vector<int> v;
int main(){
  cin >> a;
  for( int i = 0, aux; i < a; i++ ){
    cin >> aux;
    v.push_back(aux*aux);
  }
  sort(v.begin(), v.end());
  for(auto i = v.begin(); i != v.end(); ++i )
    cout << *i << endl;
  return 0;
}
