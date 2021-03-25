/*
#include <iostream>
#include <string>
#include <thread>
#include <chrono>
using namespace std;
#define N_THREADS 5
void print(int n, const string &str){
  string msg = to_string(n) + " " + str;
  cout << msg << endl;
  this_thread::sleep_for(chrono::milliseconds(10000));
}
int main(){
  string s[] = {"IIA", "IB", "IM", "II", "ITE"};
  thread threads[N_THREADS];
  for( int i = 0; i < N_THREADS; i++ ){
    threads[i] = thread(print, i, s[i]);
    threads[i].join();
  }
  return 0;
}
*/
#include <iostream>
#include <thread>
using namespace std;
int main(){
  thread t;
  cout << "holas" << endl;
  return 0;
}
