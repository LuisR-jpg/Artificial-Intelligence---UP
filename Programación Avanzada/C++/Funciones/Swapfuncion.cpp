#include <iostream>
using namespace std;
void swap(int&, int&);
int main(){
  int x = 10, y = 80;
  cout << x << " " << y << endl;
  swap(x, y);
  cout << x << " " << y;
  return 0;
}
void swap( int &a, int &b ){
  int aux = a;
  a = b; 
  b = aux;
}

