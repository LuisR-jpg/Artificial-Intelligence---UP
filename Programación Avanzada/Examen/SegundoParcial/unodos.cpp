#include <iostream>
#include <math.h>
#include <vector>
using namespace std;
int a[3];
vector<int> v;
int goodTriplets(){
  int ans = 0;
  for(int i = 0; i < v.size() - 2; i++){
    for(int j = i + 1; j < v.size() - 1; j++){
      for(int k = j + 1; k < v.size(); k++){
	if(abs(v[i] - v[j]) <= a[0] && abs(v[j] - v[k]) <= a[1] && abs(v[i] - v[k]) <= a[2])
	    ans++;
      }
    }
  }
  return ans;
}
int main(){
  int n;
  cin >> n;
  v.resize(n);
  for(int i = 0; i < n; i++)
    cin >> v[i];
  for(int i = 0; i < 3; i++)
    cin >> a[i];
  cout << goodTriplets();
  return 0;
}
