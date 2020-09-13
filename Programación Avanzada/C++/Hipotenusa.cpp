//1.- Escriba un programa que lea de la entrada estándar los dos catetos de un 
//triángulo rectángulo y escriba en la salida estándar su hipotenusa.
#include <iostream>
#include <math.h>
using namespace std;
int main(){
	double a, b;
	cin >> a >> b;
	cout << sqrt(a*a + b*b) << endl;
	return 0;
}
