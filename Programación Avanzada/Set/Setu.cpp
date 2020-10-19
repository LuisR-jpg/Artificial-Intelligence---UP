#include <iostream>
#include <string>
#include <set>
using namespace std;
class Test{
  //private: //Buena practica pero no necesario
  int id;
  string name;
  public:
    Test(): id(0), name(""){}
    Test(int id, string name): id(id), name(name){}
    void print() const{ //Para que el iterador no me afecte lo que haga
      cout << id << ": " << name << endl;
    }
    bool operator < (const Test &other) const{
      //return this -> id < other.id;
      return id < other.id;
    }
};
int main(){
  set<int> numbers;
  numbers.insert(50);
  numbers.insert(40);
  numbers.insert(30);
  numbers.insert(20);
  numbers.insert(10);
  numbers.insert(50);
  for(set<int>::iterator it = numbers.begin(); it != numbers.end(); it++){
    cout << *it << endl;
  }
  int x = 50;
  //Encontrar un valor
  set<int>::iterator itFind = numbers.find(x);
  if(itFind != numbers.end()){
    cout << "Encontrado: " << *itFind << endl;
  }
  //Otra forma
  if(numbers.count(x)){ //Regresa booleano, si existe o no
    cout << "Found: " << x << endl << endl;
  }
  //Probando con mi propia clase
  set<Test> tests;
  tests.insert(Test(10, "Sofia"));
  tests.insert(Test(20, "Sara"));
  tests.insert(Test(30, "Fer"));
  for(set<Test>::iterator it = tests.begin(); it != tests.end(); it++){
    it -> print();
  }
  return 0;
}

