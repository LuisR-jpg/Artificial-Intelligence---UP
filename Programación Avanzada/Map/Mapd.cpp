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
};
int main(){
  map<int, Person> people;
  people[50] = Person("Josue", 19);
  people[51] = Person("Gamapro", 18);
  people[1] = Person("Ricardo", 19);
  people.insert(make_pair(90, Person("Fer", 19)));
  people.insert(make_pair(50, Person("Sara", 19)));
  for(map<int, Person>::iterator it = people.begin(); it != people.end(); it++){
    cout << it -> first << ": ";
    it -> second.print();
  }
  return 0;
}
