#include <iostream>
#include <time.h>
#include <thread>
using namespace std;
void it(int n){
  for( int i = 0; i < n; i++ );
  cout << n << endl;
}
int main(){
  srand(time(NULL));
  int n = rand() % 100;
  thread a(it, n);
  thread i(it, n);
  i.join();
  a.join();
  return 0;
}
