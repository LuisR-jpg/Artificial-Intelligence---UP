#include <iostream>
#include <thread>
#include <chrono>
using namespace std;
void tiempo(int n){
  this_thread::sleep_for(chrono::milliseconds(n * 1000) );
}
int main(){
  int j, u;
  cin >> j;
  while( j > 0 ){
    if( j - 5 >= 0 ) u = 5;
    else if( j - 3 >= 0 ) u = 3;
    else u = 1;
    j -= u;
    thread t(tiempo, u);
    t.join();
  }
  return 0;
}
