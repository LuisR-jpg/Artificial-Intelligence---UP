#include <iostream>
#include <thread>
using namespace std;
void foo(int a){
  for( int i = 0; i < 10; i++ )
    cout << "Hi from t thread: " << i << endl;
}
int main(){
  thread t(foo, 10); //Crear hilo
  t.join(); //Esperamos a que termine el hilo
  for( int i = 0; i < 10; i++ )
    cout << "Hi from master thread: " << i << endl;
  return 0;
}
