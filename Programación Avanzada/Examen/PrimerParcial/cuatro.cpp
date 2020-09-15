#include <iostream>
#include <string>
#include <string.h>
using namespace std;
int main(){
  string s, cad;
//  cin.getline(s, 100, '\n');
  getline(cin, s);
  cout << "\"";
  int pos = s.find_first_of(' '), a = 0;
  while( pos > 0 ){
    cad = s.substr(a, pos-a);
    a = pos + 1;
    for( int i = (int)cad.size() - 1; i > -1; i-- )
      cout << cad[i];
    cout << " ";
    pos = s.find_first_of(' ', a);
  }
  cad = s.substr(s.find_last_of(' ') + 1);
  for( int i = (int)cad.size() - 1; i >= 0; i-- )
    cout << cad[i];
  cout << "\"" << endl;
}
