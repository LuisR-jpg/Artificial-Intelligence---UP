#include <iostream>
#define f first
#define s second
using namespace std;
int main(){
  pair<int, string> p(3, "tres");
  cout << p.f << " " << p.s << "\n";
  p = make_pair(2, "dos");
  cout << p.f << " " << p.s << "\n";
  p = {1, "uno"};
  cout << p.f << " " << p.s << "\n";
  p.f = 0, p.s = "cero";
  cout << p.f << " " << p.s << "\n";
  return 0;
}
