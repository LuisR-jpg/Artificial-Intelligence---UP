#include <iostream>
#include <stack>
#include <queue>
using namespace std;
class Test{
  private:
  string name;
  public:
  Test(): name(""){}
  Test(string name): name(name){}
  void print(){
    cout << name << endl;
  }
};
int main(){
  stack<Test> testStack;
  testStack.push(Test("Mke"));
  testStack.push(Test("Rafa"));
  testStack.push(Test("Josue"));
  Test &test1 = testStack.top();
  testStack.pop();
  Test &test2 = testStack.top();
  test2.print();

  cout << endl;
  queue<Test> testQueue;
  testQueue.push(Test("Lalito"));
  testQueue.push(Test("Samuel"));
  testQueue.push(Test("Ricardo"));
  testQueue.back().print();
  cout << endl;
  
  while(testQueue.size()){
    Test &test = testQueue.front();
    test.print();
    testQueue.pop();
  }
  return 0;
}
