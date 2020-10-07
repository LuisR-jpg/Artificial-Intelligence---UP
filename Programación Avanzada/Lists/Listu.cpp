#include <iostream>
#include <list>
using namespace std;
int main(){
  list<int> numbers;
  numbers.push_back(1);
  numbers.push_back(2);
  numbers.push_back(3);
  numbers.push_front(0);
  for( list<int>::iterator it = numbers.begin(); it != numbers.end(); it++ )
    cout << *it << endl;
  //list<int>::iterator it = numbers.begin();
  list<int>::iterator it = numbers.end();
  //auto it = numbers.begin();
  it++;
  numbers.insert(it, 100);
  cout << endl;
  for( list<int>::iterator it = numbers.begin(); it != numbers.end(); it++ )
    cout << *it << endl;
  auto d_it = numbers.begin();
  d_it++;
  numbers.erase(d_it);
  cout << endl;
  for( list<int>::iterator it = numbers.begin(); it != numbers.end(); it++ )
    cout << *it << endl;
  return 0;
}
