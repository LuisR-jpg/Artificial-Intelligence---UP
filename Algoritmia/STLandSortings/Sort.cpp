#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
int main(){
  int n = 5;
  int a[] = {3, 2, 1, 4, 5};
  sort(a, a + n);
  vector<int> b = {5, 4, 3, 1, 2};
  sort(b.begin(), b.end(), greater<int>());
  for(int i = 0; i < n; cout << a[i++] << " ");
  cout << endl;
  for(auto x: b) cout << x << " ";
  return 0;
}
