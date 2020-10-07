/*
 SIZE es el numero de elementos que tienes en el vector.
 CAPACITY es la cantidad de memoria que está reservada en ese momento.
 MAX_SIZE es la memoria total que puede dar tu PC.
*/
#include <iostream>
#include <vector>
using namespace std;
int main(){
  vector<double> numbers(0);
  cout << "Size: " << numbers.size() << endl;
  int capacity = numbers.capacity(); 
  cout << capacity << endl;
  for( int i = 0; i < 1000; i++ ){
    if( numbers.capacity() != capacity ){
      capacity = numbers.capacity(); 
      cout << "Capacity: " << capacity << endl;
    }
    numbers.push_back(i);
  }
  numbers.clear();
  cout << "Capacity: " << numbers.capacity() << endl;
  numbers.reserve(1000);
  cout << "Capacity: " << numbers.capacity() << endl;
  numbers.resize(100);
  cout << "Capacity: " << numbers.capacity() << endl;
  return 0;
}
