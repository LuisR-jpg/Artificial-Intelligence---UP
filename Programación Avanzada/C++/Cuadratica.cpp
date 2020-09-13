//3.- Escriba un programa que calcule las soluciones de una ecuación de 
//segundo grado de la forma ax^2 + bx + c = 0, teniendo en cuenta que: 
//(-b+sqrt(pow(b,2)-4*a*c))/(2*a) y (-b-sqrt(pow(b,2)-4*a*c))/(2*a)
#include <iostream>
#include <math.h>
using namespace std;
int main(){
	double a, b, c;
	cin >> a >> b >> c;
	cout << "Solucion 1: " << (-b+sqrt(pow(b,2)-4*a*c))/(2*a) << endl;
	cout << "Solucion 2: " << (-b-sqrt(pow(b,2)-4*a*c))/(2*a);
	return 0;
}
