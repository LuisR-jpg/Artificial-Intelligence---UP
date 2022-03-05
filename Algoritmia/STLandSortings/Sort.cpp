#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
int main(){
  int n = 6;
  int a[] = {100, 3, 2, 1, 4, 5};
  sort(a, a + n);
  vector<int> b = {5, 4, 3, 1, 2, 2000};
  //sort(b.begin(), b.end());
  sort(b.begin(), b.end(), greater<int>()); //Sorts the vector in reverse
  for(int i = 0; i < n; cout << a[i++] << " ");
  cout << endl;
  for(auto x: b) cout << x << " ";
  return 0;
}
