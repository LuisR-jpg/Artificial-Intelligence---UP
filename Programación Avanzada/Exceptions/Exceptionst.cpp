#include <iostream>
#include <exception>
using namespace std;

/*
const
means that this function (which is a member function) will not change the observable state of the object it is called on. 
The compiler enforces this by not allowing you to call non-const methods from this one, and by not allowing you to modify the values of members.
throw() 
means that you promise to the compiler that this function will never allow an exception to be emitted. This is called an exception specification.
*/

class MyException: public exception {
public:
	virtual const char* what() const throw() {
		return "Something bad happened!";
	}
};

class Test {
public:
	void goesWrong() {
		throw MyException();
	}
};

int main() {
	Test test;
	try {
		test.goesWrong();
	}
	catch(MyException &e) {
		cout << e.what() << endl;
	}
}
