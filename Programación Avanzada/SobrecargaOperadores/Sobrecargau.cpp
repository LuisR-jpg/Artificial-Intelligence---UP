#include <iostream>
using namespace std;
class test{
  public:
    int id;
    string name;
    test() : id(0), name("") {}
    test(int id, string name) : id(id), name(name) {}
    void print() const{
      cout << id << ": " << name << endl;
    }
    const test& operator = (const test &other){
      cout << "Sobrecarga operador = \n";
      this->id = other.id+1;
      this->name = other.name;
      return *this;
    }
    ~test(){}
};

int main(){
    test test1(10, "Virgilio");
    test1.print();
    test test2(111, "Juan");
    test2.print();
    test1 = test2;
    test1.print();
    return 0;
}
