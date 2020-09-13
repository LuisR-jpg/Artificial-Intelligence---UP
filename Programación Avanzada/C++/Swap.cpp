#include <iostream>
using namespace std;
int main(){
	double a, b;
	cin >> a >> b;
	//Sin memoria extra
	a = a + b;
	b = a - b;
	a = a - b;
	//Manera mas intuitiva
	double aux = a;
	a = b;
	b = aux;
	cout << a << " " << b;
	return 0;
}
