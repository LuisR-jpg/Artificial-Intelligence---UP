#include <iostream>
#include <vector>
using namespace std;
int main(){
  cout << "Ingresa tamano, y los k pasos: ";
  int n, k;
  vector<int> v, a;
  cin >> n >> k;
  for( int i = 0, aux; i < n; i++ ){
    cin >> aux;
    v.push_back(aux);
  }
  a.resize(v.size());
  for( int i = 0; i < n; i++ ){
    a[i] = v[(i+k+1) % n];
    cout << a[i] << " ";
  }
  return 0;
}
