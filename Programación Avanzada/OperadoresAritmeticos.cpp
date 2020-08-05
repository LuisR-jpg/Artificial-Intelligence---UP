#include <iostream>
using namespace std;
int a, b, suma, resta, multiplicacion;
double division;
int main(){
	cin >> a >> b;
	suma = a + b;
	resta = a - b;
	multiplicacion = a * b;
	division = double(a / b);
	cout << "La suma es: " << suma << "\nLa resta es: " << resta << "\nLa multiplicacion es: " << multiplicacion;
	cout << "\nLa division es: " << double(division) << endl;
	return 0;
}
