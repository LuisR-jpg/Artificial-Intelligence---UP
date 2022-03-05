#include <iostream>
#define f first
#define s second
using namespace std;
int main(){
  pair<int, string> p(3, "tres");
  p = make_pair(2, "dos");
  p = {1, "uno"};
  p.first = 0, p.second = "cero";
  p.first = 100;
  cout << p.first << " " << p.second;

  /*
  cout << p.f << " " << p.s << "\n";
  */
  return 0;
}
