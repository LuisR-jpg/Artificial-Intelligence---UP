#include <iostream>
using namespace std;
class test{
public:
    int id;
    string name;
    test() : id(0), name("") {}
    test(int id, string name) : id(id), name(name) {}
    void print() const{
        cout << id << ":" << name << endl;
    }
    const test &operator = (const test &other){
        cout << "sobrecarga operador = \n";
        this->id = other.id + 1;
        this->name = other.name;
        return *this;
    }
    friend ostream &operator<<(ostream &output, const test &t){
        output << t.id << ": " << t.name;
        return output;
    }
    ~test() {}
};
int main(){
    test test1(10, "Virgilio");
    cout << test1;
    return 0;
}
