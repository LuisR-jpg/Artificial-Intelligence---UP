#include <iostream>
#include <set>
#include <string>
using namespace std;
int main(){
  string arr[] = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."};
  string s;
  getline(cin, s);
  set<string> se;
  for(int i = 0, a = -1; i < s.size(); i++){
    if(a >= 0 && s[i] == '"'){
      string b = s.substr(a + 1, i - a - 1), c = "";
      a = -1;
      for(int j = 0; j < b.size(); j++)
	c += arr[b[j] - 'a'];
      se.insert(c);
      continue;
    }
    if(a == -1 && s[i] == '"') a = i;
  }
  cout << se.size() << endl;
  return 0;
}
