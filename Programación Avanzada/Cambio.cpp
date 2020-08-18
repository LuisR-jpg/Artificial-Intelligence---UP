#include <iostream>
#include "Cambio.h"
using namespace std;
int main(){
	int money, cien, cincuenta, veinte, diez, cinco, uno;
	cin >> money;
	cambio(money, cien, cincuenta, veinte, diez, cinco, uno);
	cout << money << " se dividen en: " << endl;
	cout << "\t" << cien << " billetes de cien\n\t" << cincuenta << " billetes de cincuenta\n\t";
	cout << veinte << " billetes de veinte\n\t" << diez << " monedas de diez\n\t" << cinco;
	cout << " monedas de cinco\n\t" << uno << " pesos" << endl;
	return 0;
}
void cambio(int money, int &cien, int &cincuenta, int &veinte, int &diez, int &cinco, int &uno){
	cien = money / 100; money %= 100;
	cincuenta = money / 50; money %= 50;
	veinte = money / 20; money %= 20;
	diez = money / 10; money %= 10;
	cinco = money / 5; money %= 5;
	uno = money;
}