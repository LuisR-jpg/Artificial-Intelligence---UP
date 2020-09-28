#include <bits/stdc++.h>
using namespace std;
int main(){
  char arr[] = {'E', 'I', 'J', 'F', 'U', 'A', 'X', 'V', 'H', 'W', 'P', ' ', 'G', 'S', 'R', 'K', 'O', 'B', 'T', 'Q', 'Y', 'D', 'M', 'L', 'Z', 'N', 'C'};
  char arr2[] = {' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
  string s;
  getline(cin, s);
  for( int i = 0; i < s.size(); i++ )
    cout << arr2[s[i] - 'A'];
  return 0;
}
