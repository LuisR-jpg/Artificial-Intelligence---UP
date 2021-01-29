#include <iostream>
using namespace std;
int main(){
  int a[] = {10, 20, 30, 40, 50};
  for( int i = 0; i < 5; i++ )
    cout << i << ": " << a[i] << " ";
  cout << endl;
  for( int* p = a; p < a + 5; p++ )
    cout << p-a << ": " << *p << " ";
  cout << endl;
  return 0;
}
