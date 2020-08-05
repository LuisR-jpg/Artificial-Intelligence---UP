//2.- Realice un programa que calcule el valor que toma la siguiente función para 
//unos valores dados de x e y: f(x,y) = sqrt(x) / (pow(y,2)-1)
#include <iostream>
#include <math.h>
using namespace std;
int main(){
	double x, y;
	cin >> x >> y;
	cout << sqrt(x) / (pow(y, 2)-1) << endl;
	return 0;
}
