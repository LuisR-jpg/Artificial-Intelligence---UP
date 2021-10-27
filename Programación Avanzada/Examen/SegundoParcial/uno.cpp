#include <iostream>
#include <vector>
using namespace std;
int arr[3];
vector<int> v;
int goodTriplets(){
  for(int i = 0; i < 3; i++)
    arr[i] = v[v.size() - 4 + i];
  int ans = 0;
  int n = v.size() - 3;
  for(int i = 0; i < n - 2; i++)
    for(int j = i + 1; j < n - 1; j++)
      for(int k = j + 1; k < n; k++)
	if(abs(v[i] - v[j]) <= arr[0] && abs(v[j] - v[k]) <= arr[1] && abs(v[i] - v[k]) <= arr[2])
	    ans++;
  return ans;
}

int main(){
  string a;
  getline(cin, a);
  int ans = 0;
  for(int i = 0, b = -1; i < a.size(); i++){
    string c = "";
    if(i < a.size() - 1 && a[i] >= '0' && a[i] <= '9' && b == -1) b = i;
    else if(b >= 0 && (a[i] < '0' || a[i] > '9')) c = a.substr(b, i - b), b = -1;
    if(i == a.size() - 1) c += a[a.size() - 1];
    cout << c << endl;
    if(c != "") v.push_back(stoi(c));
  }
  for(auto x: v)
    cout << x << " ";
  cout << endl;
  cout << goodTriplets() << endl;
  return 0;
}
