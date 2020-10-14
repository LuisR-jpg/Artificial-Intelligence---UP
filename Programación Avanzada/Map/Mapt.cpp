//Se sobreescriben las llaves
#include <iostream>
#include <map>
#include <string>
using namespace std;
class Person{
  private: 
    string name;
    int age;
  public:
    Person():name(""), age(0){}
    Person(string name, int age): name(name), age(age){}
    void print(){
      cout << name << ": " << age << endl;
    }
    bool operator < (const Persona &other) const{
      if(name == other.name) return age < other.age;
      else return name < other.name;
    }
};
int main(){
  map<Person, int> people;
  string au = "Hola"; 
  string ad = "HoaZ";
  bool a = au < ad; //Son comparables
  bool r = Personau < Personad; //No implementado: Sobrecarga de operadores is needed
  people[Person("Cristi", 18)] = 40;
  people[Person("Fabrizio", 19)] = 400;
  people[Person("Sara", 1800)] = 4;
  for(map<Person, int>::iterator it = people.begin(); it != people.end(); it++){
    it -> first.print();
    cout << it -> second << endl;
  }
  return 0;
}
